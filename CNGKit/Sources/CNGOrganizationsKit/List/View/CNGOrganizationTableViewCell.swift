/**
 
 Организация.
 
 */

import UIKit
import CoreKitUI
import ResourcesKit

/// Протокол поддержки событий вида.
public protocol CNGOrganizationTableViewCellDelegate: AnyObject {
    
    /// Запрос на изменение значения избранного.
    /// - Parameters:
    ///   - contactTableViewCell: Ячейка контакта для изменения избранного.
    ///   - sender: Кнопка, инициирующая событие.
    func organizationTableViewCell(_ organizationTableViewCell: CNGOrganizationTableViewCell, willChangeFavorite sender: Any?)
    
}

public class CNGOrganizationTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CNGOrganizationTableViewCellIdentifier"
    
    weak var delegate: CNGOrganizationTableViewCellDelegate?
    
    /// Основной контейнер содержимого
    private let stackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let dateStackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.alignment = .center
        return stackView
    }()
    
    private let dateIconView = UIImageView(image: UIImage(systemName: "clock"))
    
    private let organizationStackView = CKStackView.vertical()
    
    public let iconView: RKEventIconView = RKEventIconView(style: .organization)
    
    public let organizationLabel: CKLabel = CKLabel(textStyle: .body, weight: .regular)
    
    public let addressLabel = CKLabel(textStyle: .subheadline, weight: .regular)
    
    public let dateLabel = CKLabel(textStyle: .subheadline, weight: .regular)
    
    public let favoriteButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.accessibilityLabel = "Favorite"
        return button
    }()
    
    // MARK: - Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubviews()
        constrainSubviews()
        setupGestures()
        styleSubviews()
    }
    
    private func addSubviews() {
        [iconView, organizationStackView, dateStackView, favoriteButton].forEach { stackView.addArrangedSubview($0) }
        [organizationLabel, addressLabel].forEach { organizationStackView.addArrangedSubview($0) }
        [dateIconView, dateLabel].forEach { dateStackView.addArrangedSubview($0) }
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [iconView, stackView, organizationLabel, addressLabel, favoriteButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        var constraints = stackView.constraints(equalTo: self)
        constraints += [
            favoriteButton.widthAnchor.constraint(equalTo: favoriteButton.heightAnchor),
            favoriteButton.heightAnchor.constraint(equalToConstant: 20),
            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 47),
            dateIconView.widthAnchor.constraint(equalTo: dateIconView.heightAnchor),
            dateIconView.heightAnchor.constraint(equalToConstant: 15)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func styleSubviews() {
        let style = CKStyle()
        backgroundColor = style.color.customWhite
        
        stackView.spacing = style.dimension.spacing2
        stackView.directionalLayoutMargins = style.dimension.directionalInsets2
        dateStackView.spacing = style.dimension.spacing / 2
        
        favoriteButton.tintColor = style.color.customYellow
        addressLabel.textColor = style.color.customGray
        dateIconView.tintColor = style.color.customGray
        dateLabel.textColor = style.color.customGray
    }
    
    private func setupGestures() {
        [favoriteButton].forEach {
            $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case favoriteButton: delegate?.organizationTableViewCell(self, willChangeFavorite: sender)
        default: fatalError("Target not set up properly")
        }
    }
    
}
