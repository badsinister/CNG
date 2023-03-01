/**
 
 Контакт. Вид.
 
 */

import UIKit
import CoreKitUI
import ResourcesKit

/// Протокол поддержки событий вида.
public protocol CNGSimpleContactViewDelegate: AnyObject {
    
    func contactView(_ contactView: CNGSimpleContactView, willChangeFavorite sender: Any?)
    
}

public class CNGSimpleContactView: CKView {
    
    weak var delegate: CNGSimpleContactViewDelegate?
    
    private let contentBackgroundView = CKView()
    
    /// Заполнитель
    private let fillView = CKView()
    
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
    public let additionalInfoView = CKBulletListView()

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
    
    private let spaceView = CKView()
    
    // MARK: - Make View
    
    public override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        styleSubviews()
        setupGestures()
    }
    
    private func addSubviews() {
        [contentBackgroundView, fillView].forEach { stackView.addArrangedSubview($0) }
        [iconView, textStackView, favoriteButton].forEach { contentStackView.addArrangedSubview($0) }
        [nameLabel, inactiveLabel, specialtiesLabel, additionalInfoView].forEach { textStackView.addArrangedSubview($0) }
        contentBackgroundView.addSubview(contentStackView)
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [contentBackgroundView, fillView, additionalInfoView, contentStackView, stackView, nameLabel, favoriteButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        var constraints = stackView.constraints(equalTo: self, directions: [.trailing, .leading, .bottom])
        constraints += contentStackView.constraints(equalTo: contentBackgroundView)
        constraints += [
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            favoriteButton.widthAnchor.constraint(equalTo: favoriteButton.heightAnchor),
            favoriteButton.heightAnchor.constraint(equalToConstant: 27),
            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 88)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func styleSubviews() {
        let style = style()
        contentStackView.directionalLayoutMargins = style.dimension.directionalInsets
        contentBackgroundView.backgroundColor = style.color.customWhite
        inactiveLabel.textColor = style.color.customRed
        favoriteButton.tintColor = style.color.customYellow
        contentStackView.setCustomSpacing(style.dimension.spacing2, after: iconView)
        //stackView.setCustomSpacing(style.dimension.spacing3, after: secondSeparatorView)
        stackView.spacing = style.dimension.spacing3
        textStackView.spacing = style.dimension.spacing
        textStackView.setCustomSpacing(style.dimension.spacing3, after: specialtiesLabel)
    }
    
    private func setupGestures() {
        [favoriteButton].forEach {
            $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case favoriteButton: delegate?.contactView(self, willChangeFavorite: sender)
        default: fatalError("Target not set up properly")
        }
    }
    
}
