/**
 
 Событие. Вид.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI
import ResourcesKit

/// Протокол поддержки событий вида `CNGEventView`.
public protocol CNGEventViewDelegate: AnyObject {
    
    /// Изменение даты начала события.
    ///
    /// - Parameters:
    ///   - eventView: Вид события.
    ///   - sender: Инициатор действия, объект `UIView`.
    func eventView(_ eventView: CNGEventView, willChangeStartDateTime sender: Any?)

    /// Изменение даты окончания события.
    ///
    /// - Parameters:
    ///   - eventView: Вид события.
    ///   - sender: Инициатор действия, объект `UIView`.
    func eventView(_ eventView: CNGEventView, willChangeEndDateTime sender: Any?)

    /// Изменение цели события.
    ///
    /// - Parameters:
    ///   - eventView: Вид события.
    ///   - sender: Инициатор действия, объект `UIView`.
    func eventView(_ eventView: CNGEventView, willChangeTarget sender: Any?)
    
    func eventView(_ eventView: CNGEventView, willChange sender: Any?)

}

public class CNGEventView: CKView {
    
    weak var delegate: CNGEventViewDelegate?
    
    /// Основной контейнер
    private let stackView = CKStackView.vertical()
    
    private let contentStackView: CKStackView = {
        let stack = CKStackView.horizontal()
        stack.alignment = .top
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private let textStackView = CKStackView.vertical()
    
    /// Контейнер дополнительной информации
    private let infoStackView = CKStackView.vertical()
    
    public let iconView: RKEventIconView = RKEventIconView(style: .contact)
    
    public let nameLabel = CKLabel(textStyle: .title2, weight: .regular)
    
    public let inactiveLabel = CKLabel(textStyle: .body, weight: .regular)
    
    public let specialtiesLabel = CKLabel(textStyle: .body, weight: .regular)
    
    public let favoriteButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.accessibilityLabel = "Favorite"
        return button
    }()
    
    // MARK: - Блок дополнительной информации: Даты, Цели, Сценария
    
    /// Фон дополнительной информации.
    private let detailsBackgroundView: CKView = {
        let view = CKView()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()

    /// Дополнительная информация. Даты / цели.
    private let detailsStackView: CKStackView = {
        let stack = CKStackView.horizontal()
        stack.alignment = .leading
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        return stack
    }()
    
    private let dateTimeStackView = CKStackView.vertical()
    
    /// Дата начала события.
    public let startDateTimeControlView = CNGDateTimeControlView(dateTimeStyle: .startDateTime)
    
    /// Дата окончания события.
    public let endDateTimeControlView = CNGDateTimeControlView(dateTimeStyle: .endDateTime)
    
    /// Пустой заполнитель нижней части экрана.
    private let fillView = CKView()

    // MARK: - Блок дополнительной информации
    
    private let additionalStackView = CKStackView.vertical()

    public let targetControlView = CNGTargetControlView(title: "Select target")
    
    // MARK: - Make View
    
    public override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        styleSubviews()
        setupGestures()
    }
    
    private func addSubviews() {
        [contentStackView, detailsStackView, fillView].forEach { stackView.addArrangedSubview($0) }
        [iconView, textStackView, favoriteButton].forEach { contentStackView.addArrangedSubview($0) }
        [nameLabel, inactiveLabel, specialtiesLabel, infoStackView].forEach { textStackView.addArrangedSubview($0) }
        /// Дополнительная информация
        [startDateTimeControlView, endDateTimeControlView].forEach { dateTimeStackView.addArrangedSubview($0) }
        [targetControlView].forEach { additionalStackView.addArrangedSubview($0) }
        [dateTimeStackView, additionalStackView].forEach { detailsStackView.addArrangedSubview($0) }
        detailsStackView.insertSubview(detailsBackgroundView, at: 0)
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [fillView, contentStackView, stackView, nameLabel, favoriteButton, startDateTimeControlView, endDateTimeControlView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        var constraints = stackView.constraints(equalTo: self)
        constraints += [
            favoriteButton.widthAnchor.constraint(equalTo: favoriteButton.heightAnchor),
            favoriteButton.heightAnchor.constraint(equalToConstant: 27),
            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 88)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func styleSubviews() {
        let style = style()
        contentStackView.directionalLayoutMargins = style.dimension.directionalInsets4
        detailsStackView.directionalLayoutMargins = style.dimension.directionalInsets4
        //contentBackgroundView.backgroundColor = style.color.customWhite
        inactiveLabel.textColor = style.color.customRed
        favoriteButton.tintColor = style.color.customGray2
        contentStackView.setCustomSpacing(style.dimension.spacing2, after: iconView)
        //stackView.setCustomSpacing(style.dimension.spacing3, after: secondSeparatorView)
        //stackView.spacing = style.dimension.spacing3
        textStackView.spacing = style.dimension.spacing
        textStackView.setCustomSpacing(style.dimension.spacing3, after: specialtiesLabel)
        infoStackView.spacing = style.dimension.spacing
        detailsStackView.spacing = style.dimension.spacing4
        dateTimeStackView.spacing = style.dimension.spacing4
        detailsBackgroundView.backgroundColor = style.color.customWhite
    }
    
    private func setupGestures() {
        startDateTimeControlView.delegate = self
        endDateTimeControlView.delegate = self
        [favoriteButton].forEach {
            $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case favoriteButton: delegate?.eventView(self, willChange: sender)
        default: fatalError("Target not set up properly")
        }
    }
    
    // MARK: - Info
    
    public enum ContactInfoStyle {
        case datetime
        case email
        case phone
        case text
        
        /// Иконка для списка
        var image: UIImage {
            let configuration = UIImage.SymbolConfiguration(pointSize: 16, weight: .regular)
            let image: UIImage?
            switch self {
            case .datetime: image = UIImage(systemName: "clock", withConfiguration: configuration)!
            case .email: image = UIImage(systemName: "envelope", withConfiguration: configuration)!
            case .phone: image = UIImage(systemName: "phone", withConfiguration: configuration)!
            case .text: image = UIImage(systemName: "checkmark.circle", withConfiguration: configuration)!
            }
            return image ?? UIImage()
        }
    }
    
    public func clearInfo() {
        infoStackView.clear()
    }
    
    public func addInfo(_ text: String, style: ContactInfoStyle) {
        let stackView = CKStackView.horizontal()
        stackView.spacing = self.style().dimension.spacing
        stackView.alignment = .firstBaseline
        
        let imageView = UIImageView(image: style.image)
        imageView.tintColor = self.style().color.customGray
        var constraints = [imageView.widthAnchor.constraint(equalToConstant: 20)]
        if style != .email {
            constraints += [imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)]
        }
        NSLayoutConstraint.activate(constraints)
        
        let textLabel = CKLabel(textStyle: .subheadline, weight: .regular)
        textLabel.textColor = self.style().color.customGray
        textLabel.text = text
        
        [imageView, textLabel].forEach { stackView.addArrangedSubview($0) }
        infoStackView.addArrangedSubview(stackView)
    }
    
}

extension CNGEventView: CNGDateTimeControlViewDelegate {
    
    /// Выбор времени начала / окончания события
    public func didSelectDateTimeControlView(_ dateTimeControlView: CNGDateTimeControlView) {
        switch dateTimeControlView.dateTimeView.dateTimeStyle {
        case .startDateTime: delegate?.eventView(self, willChangeStartDateTime: dateTimeControlView)
        case .endDateTime: delegate?.eventView(self, willChangeEndDateTime: dateTimeControlView)
        }
    }
    
}
