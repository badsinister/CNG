/**
 
 Элемент файловой структуры (директория/файл).
 
 */

import UIKit
import CoreKitUI
import CNGKitUI
import ResourcesKit

/// Протокол поддержки событий вида.
public protocol CNGLibraryEntityTableViewCellDelegate: AnyObject {
    
    /// Запрос на действия для элемента.
    /// - Parameters:
    ///   - libraryEntityTableViewCell: Ячейка для запроса действий.
    ///   - sender: Кнопка, инициирующая событие.
    func libraryEntityTableViewCell(_ libraryEntityTableViewCell: CNGLibraryEntityTableViewCell, willShowActions sender: Any?)
}

public class CNGLibraryEntityTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CNGLibraryEntityTableViewCellIdentifier"
    
    weak var delegate: CNGLibraryEntityTableViewCellDelegate?
    
    /// Основной контейнер содержимого
    private let stackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    private let textContainerStackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let dateStackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.alignment = .center
        return stackView
    }()
    
    private let dateIconView = UIImageView(image: UIImage(systemName: "clock"))
    
    private let contactStackView = CKStackView.vertical()
    
    private let organizationStackView = CKStackView.vertical()
    
    public let iconView: RKFileIconView = RKFileIconView(style: .folder)
    
    public let nameLabel: CKLabel = CKLabel(textStyle: .body, weight: .regular)
    
    public let specialtyLabel = CKLabel(textStyle: .subheadline, weight: .regular)
    
    public let organizationLabel: CKLabel = CKLabel(textStyle: .body, weight: .regular)
    
    public let addressLabel = CKLabel(textStyle: .subheadline, weight: .regular)
    
    public let dateLabel = CKLabel(textStyle: .subheadline, weight: .regular)
    
    public let actionsButton: UIButton = {
        let button = UIButton()
        //button.imageView?.contentMode = .scaleAspectFit
        //button.contentVerticalAlignment = .fill
        //button.contentHorizontalAlignment = .fill
        button.accessibilityLabel = "Actions"
        button.setImage(UIImage(systemName: "ellipsis", orientation: .right)!, for: .normal)
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
        [iconView, textContainerStackView, dateStackView, actionsButton].forEach { stackView.addArrangedSubview($0) }
        [contactStackView, organizationStackView].forEach { textContainerStackView.addArrangedSubview($0) }
        [nameLabel, specialtyLabel].forEach { contactStackView.addArrangedSubview($0) }
        [organizationLabel, addressLabel].forEach { organizationStackView.addArrangedSubview($0) }
        [dateIconView, dateLabel].forEach { dateStackView.addArrangedSubview($0) }
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [iconView, stackView, nameLabel, specialtyLabel, organizationLabel, addressLabel, actionsButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        var constraints = stackView.constraints(equalTo: self)
        constraints += [
            actionsButton.widthAnchor.constraint(equalTo: actionsButton.heightAnchor),
            actionsButton.heightAnchor.constraint(equalToConstant: 20),
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
        
        actionsButton.tintColor = style.color.customYellow
        specialtyLabel.textColor = style.color.customGray
        addressLabel.textColor = style.color.customGray
        dateIconView.tintColor = style.color.customGray
        dateLabel.textColor = style.color.customGray
    }
    
    private func setupGestures() {
        [actionsButton].forEach {
            $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case actionsButton: delegate?.libraryEntityTableViewCell(self, willShowActions: sender)
        default: fatalError("Target not set up properly")
        }
    }
    
}
