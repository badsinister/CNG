/**
 
 Синхронизация. Вид.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI
import ResourcesKit

/// Протокол поддержки событий вида.
protocol CNGSynchronizationViewViewDelegate: AnyObject {
    
    func synchronizationView(_ synchronizationView: CNGSynchronizationView, willStartSynchronization sender: Any?)
}

/// ```
///     +-------------------------------------------------+
///     |                                                 |
///     |  Title label                         +-------+  |
///     |                                      |       |  |
///     |  [0]  Datetime Label                 +-------+  |
///     |                                        Title    |
///     |                                                 |
///     |  Subtitle Label                                 |
///     |                                                 |
///     |  [1]  Title:N  Title:N   Title:N                |
///     |  [2]  Title:N  Title:N   Title:N                |
///     |  [3]  Title:N  Title:N   Title:N                |
///     |                                                 |
///     |  [ Start ]                                      |
///     |                                                 |
///     +-------------------------------------------------+
/// ```
class CNGSynchronizationView: CKView {

    weak var delegate: CNGSynchronizationViewViewDelegate?

    enum Section {
        case events
        case contacts
        case organizations
        
        /// Иконка для строки
        var image: UIImage? {
            let configuration = UIImage.SymbolConfiguration(pointSize: 24, weight: .regular)
            let image: UIImage?
            switch self {
            case .events: image = UIImage(systemName: "clock", withConfiguration: configuration)
            case .contacts: image = UIImage(systemName: "person.crop.square", withConfiguration: configuration)
            case .organizations: image = UIImage(systemName: "building.2", withConfiguration: configuration)
            }
            return image
        }
        
        /// Заголовок страницы раздела
        var title: String {
            switch self {
            case .events: return "Events".capitalized
            case .contacts: return "Contacts".capitalized
            case .organizations: return "Organizations".capitalized
            }
        }
    }

    /// Контейнер содержимого вида
    private let stackView = CKStackView.vertical()

    /// Контейнер колонок
    private let columnsStackView = {
        let stackView = CKStackView.horizontal()
        stackView.alignment = .top
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    /// Контейнер контента
    private let contentStackView = {
        let stackView = CKStackView.vertical()
        stackView.alignment = .leading
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()

    /// Контейнер контента
    private let infoStackView = CKStackView.vertical()

    /// Контейнер системной информации
    private let additionalStackView = CKStackView.vertical()

    private let separatorView = CKSeparatorView()
    
    private let logoView = RKCNGLogoView()
    private var logoHeightConstraint: NSLayoutConstraint?
    
    /// Текущая версия приложения.
    let versionLabel: CKLabel = {
        let label = CKLabel(textStyle: .footnote, weight: .regular)
        label.textAlignment = .center
        label.text = "Version 0.0.0"
        return label
    }()

    private let titleLabel: CKLabel = {
        let label = CKLabel(textStyle: .title2, weight: .regular)
        label.text = "Latest synchronization time"
        return label
    }()
    
    /// Дата последней синхронизации.
    let datetimeLabel: UILabel = {
        let label = CKLabel(textStyle: .body, weight: .regular)
        label.text = "Synchronization was not done"
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = CKLabel(textStyle: .title2, weight: .regular)
        label.text = "Data to send"
        return label
    }()
    
    // MARK: - Buttons
    
    private lazy var startButton = CNGButton("Start")
    
    // MARK: - Make View

    override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        styleSubviews()
        setupGestures()
    }

    private func addSubviews() {
        [separatorView, columnsStackView].forEach { stackView.addArrangedSubview($0) }
        [contentStackView, additionalStackView].forEach { columnsStackView.addArrangedSubview($0) }
        [titleLabel, makeDatetimeView(), subtitleLabel, infoStackView, startButton].forEach { contentStackView.addArrangedSubview($0) }
        [logoView, versionLabel].forEach{ additionalStackView.addArrangedSubview($0) }
        
        [makePosition(.events, created: 10, total: 10),
         makePosition(.contacts, updated: 2),
         makePosition(.organizations, created: 23, updated: 1, total: 25)].forEach { infoStackView.addArrangedSubview($0) }
        addSubview(stackView)
    }

    private func constrainSubviews() {
        [stackView, columnsStackView, contentStackView, infoStackView, titleLabel, subtitleLabel, datetimeLabel, startButton, logoView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        logoHeightConstraint = logoView.heightAnchor.constraint(equalToConstant: 0)
        var constraints = stackView.constraints(equalTo: self)
        constraints += [
            logoView.widthAnchor.constraint(equalTo: logoView.heightAnchor, multiplier: 2.5),
            logoHeightConstraint!,
            startButton.widthAnchor.constraint(equalTo: startButton.heightAnchor, multiplier: 6),
            startButton.heightAnchor.constraint(equalToConstant: style().dimension.buttonHeight)
        ]
        NSLayoutConstraint.activate(constraints)
    }

    private func styleSubviews() {
        let style = style()
        versionLabel.textColor = style.color.customGray

        logoHeightConstraint?.constant = style.dimension.imageHeight2 * 2

        stackView.directionalLayoutMargins = style.dimension.directionalInsets
        additionalStackView.spacing = style.dimension.spacing3
        contentStackView.spacing = style.dimension.spacing4
        contentStackView.setCustomSpacing(style.dimension.spacing4 * 2, after: contentStackView.arrangedSubviews[1])
        contentStackView.setCustomSpacing(style.dimension.spacing4 * 2, after: contentStackView.arrangedSubviews[3])
        infoStackView.spacing = 32
    }

    private func setupGestures() {
        [startButton].forEach { $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside) }
    }

    @objc
    private func didTapButton(_ sender: UIButton) {
        switch sender {
        case startButton: delegate?.synchronizationView(self, willStartSynchronization: sender)
        default: fatalError("Target not set up properly")
        }
    }

    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        styleSubviews()
    }

    /// Создание позиции описания
    /// ```
    ///     +--------------------------------------------+
    ///     |  +--+  Title label                         |
    ///     |  |  |                                      |
    ///     |  +--+  Created     Changed     Total       |
    ///     +--------------------------------------------+
    /// ```
    private func makePosition(_ type: Section, created: Int = 0, updated: Int = 0, total: Int = 0) -> UIView {
        let style = style()
        let stackView = CKStackView.vertical()
        stackView.spacing = 12

        let titleLabel = CKLabel(textStyle: .subheadline, weight: .regular)
        titleLabel.textColor = style.color.customGray
        titleLabel.text = type.title

        let createLabel = CKLabel(textStyle: .body, weight: .regular)
        createLabel.text = "Created: \(created)"
        let editLabel = CKLabel(textStyle: .body, weight: .regular)
        editLabel.text = "Updated: \(updated)"
        let totalLabel = CKLabel(textStyle: .body, weight: .regular)
        totalLabel.text = "Total: \(total)"
        
        let infoStackView = CKStackView.horizontal()
        infoStackView.spacing = 24
        infoStackView.distribution = .fillEqually
        [createLabel, editLabel, totalLabel].forEach { infoStackView.addArrangedSubview($0) }

        [titleLabel, infoStackView].forEach { stackView.addArrangedSubview($0) }

        /// Контейнер строки
        let contentStackView = CKStackView.horizontal()
        contentStackView.spacing = 24
        contentStackView.alignment = .top
        
        [makeIconView(with: type.image), stackView].forEach { contentStackView.addArrangedSubview($0) }
        return contentStackView
    }
    
    /// Создание позиции времени синхронизации
    /// ```
    ///     +--------------------------------------------+
    ///     |  +--+                                      |
    ///     |  |  |  Sync Date /datetimeLabel/           |
    ///     |  +--+                                      |
    ///     +--------------------------------------------+
    /// ```
    private func makeDatetimeView() -> UIView {
        let contentStackView = CKStackView.horizontal()
        contentStackView.spacing = 24
        let image = UIImage(systemName: "clock.arrow.circlepath", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .regular))
        [makeIconView(with: image), datetimeLabel].forEach { contentStackView.addArrangedSubview($0) }
        return contentStackView
    }
    
    /// Создает вид изображения заданных размеров (28х28).
    /// - Parameter image: Изображения для отображения.
    /// - Returns: Вид с изображение заданного размера (28х28)
    private func makeIconView(with image: UIImage?) -> UIImageView {
        let imageView = UIImageView(image: image)
        imageView.tintColor = style().color.customBlack
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 28)
        ])
        return imageView
    }
}
