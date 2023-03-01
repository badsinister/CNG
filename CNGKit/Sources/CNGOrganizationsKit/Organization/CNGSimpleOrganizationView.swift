/**
 
 Организация. Вид.
 
 */

import UIKit
import CoreKitUI
import ResourcesKit

/// Протокол поддержки событий вида.
public protocol CNGSimpleOrganizationViewDelegate: AnyObject {
    
    func organizationView(_ organizationView: CNGSimpleOrganizationView, willChangeFavorite sender: Any?)
    
}

/// ```
///     +-------------------------------------------------+
///     |=================================================|
///     | [items]                                   Label |
///     |=================================================|
///     |                                                 |
///     |                  [ TableView ]                  |
///     |                                                 |
///     |                                                 |
///     +-------------------------------------------------+
/// ```
public class CNGSimpleOrganizationView: CKView {
    
    weak var delegate: CNGSimpleOrganizationViewDelegate?
    
    private let view = CKView()
    
    private let contentStackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.alignment = .top
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let textStackView = CKStackView.vertical()
    
    /// Контейнер дополнительной информации
    public let additionalInfoView = CKBulletListView()
    
    private let addressStackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.alignment = .firstBaseline
        return stackView
    }()
    
    let addressIconView: UIImageView = {
        let configuration = UIImage.SymbolConfiguration(weight: .thin)
        let image = UIImage(systemName: "building.2", withConfiguration: configuration)!
        let imageView = UIImageView(image: image)
        return imageView
    }()

    public let iconView: RKEventIconView = RKEventIconView(style: .emptiness)
    
    public let titleLabel = CKLabel(textStyle: .title2, weight: .regular)
    
    public let inactiveLabel = CKLabel(textStyle: .body, weight: .regular)
    
    public let addressLabel = CKLabel(textStyle: .body, weight: .regular)
    
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
        [iconView, textStackView, favoriteButton].forEach { contentStackView.addArrangedSubview($0) }
        [addressIconView, addressLabel].forEach { addressStackView.addArrangedSubview($0) }
        [titleLabel, inactiveLabel, addressStackView, additionalInfoView].forEach { textStackView.addArrangedSubview($0) }
        view.addSubview(contentStackView)
        addSubview(view)
    }
    
    private func constrainSubviews() {
        [view, contentStackView, additionalInfoView, favoriteButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        var constraints = contentStackView.constraints(equalTo: view)
        constraints += view.constraints(equalTo: self, directions: [.horizontal, .top])
        constraints += [
            //view.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            favoriteButton.widthAnchor.constraint(equalTo: favoriteButton.heightAnchor),
            favoriteButton.heightAnchor.constraint(equalToConstant: 27),
            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 88),
            addressIconView.widthAnchor.constraint(equalTo: addressIconView.heightAnchor),
            addressIconView.heightAnchor.constraint(equalToConstant: 24)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func styleSubviews() {
        let style = style()
        contentStackView.directionalLayoutMargins = style.dimension.directionalInsets
        addressStackView.spacing = self.style().dimension.spacing
        view.backgroundColor = style.color.customWhite
        inactiveLabel.textColor = style.color.customRed
        addressLabel.textColor = style.color.customRed
        addressIconView.tintColor = style.color.customGray
        favoriteButton.tintColor = style.color.customYellow
        contentStackView.setCustomSpacing(style.dimension.spacing2, after: iconView)
        textStackView.spacing = style.dimension.spacing
        textStackView.setCustomSpacing(style.dimension.spacing3, after: addressStackView)
    }
    
    private func setupGestures() {
        [favoriteButton].forEach {
            $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case favoriteButton: delegate?.organizationView(self, willChangeFavorite: sender)
        default: fatalError("Target not set up properly")
        }
    }
    
}
