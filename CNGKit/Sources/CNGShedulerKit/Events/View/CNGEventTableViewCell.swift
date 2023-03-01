/**
 
 Событие.
 
 */

import UIKit
import CoreKitUI
import ResourcesKit

/// Протокол поддержки событий вида.
public protocol CNGEventTableViewCellDelegate: AnyObject {
    
    /// Запрос на изменение значения избранного.
    /// - Parameters:
    ///   - eventTableViewCell: Ячейка события для изменения избранного.
    ///   - sender: Кнопка, инициирующая событие.
    func eventTableViewCell(_ eventTableViewCell: CNGEventTableViewCell, didTapButton sender: Any?)
    
}

public class CNGEventTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "CNGEventTableViewCellIdentifier"
    
    weak var delegate: CNGEventTableViewCellDelegate?
    
    private let stackBackgroundView = {
        let view = CKView()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
    
    /// Основной контейнер содержимого
    private let stackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    public let iconView: RKEventIconView = RKEventIconView(style: .organization)

    private let textStackView = CKStackView.vertical()
    
    public let titleLabel = CKLabel(textStyle: .body, weight: .regular)

    public let subtitleLabel = CKLabel(textStyle: .subheadline, weight: .regular)
    
    public let dateLabel = CKLabel(textStyle: .subheadline, weight: .regular)
    
    public let actionButton: UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.accessibilityLabel = "Action"
        return button
    }()
    
    // MARK: - Methods
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
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
        [iconView, textStackView, dateLabel, actionButton].forEach { stackView.addArrangedSubview($0) }
        [titleLabel, subtitleLabel].forEach { textStackView.addArrangedSubview($0) }
        stackView.insertSubview(stackBackgroundView, at: 0)
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        self.preservesSuperviewLayoutMargins = true
        [iconView, stackView, textStackView, titleLabel, subtitleLabel, dateLabel, actionButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            actionButton.widthAnchor.constraint(equalTo: actionButton.heightAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 20),
            iconView.widthAnchor.constraint(equalTo: iconView.heightAnchor),
            iconView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    private func styleSubviews() {
        let style = CKStyle()
        backgroundColor = .clear
        
        stackBackgroundView.backgroundColor = style.color.customWhite
        stackBackgroundView.layer.borderColor = style.color.separator.cgColor
        stackBackgroundView.layer.borderWidth = style.dimension.separatorHeight
        stackBackgroundView.layer.cornerRadius = style.dimension.cornerRadius2
        stackBackgroundView.clipsToBounds = true

        stackView.spacing = style.dimension.spacing2
        stackView.directionalLayoutMargins = style.dimension.directionalInsets2
        textStackView.spacing = style.dimension.spacing / 2

        actionButton.tintColor = style.color.customYellow
        subtitleLabel.textColor = style.color.customGray
    }
    
    private func setupGestures() {
        [actionButton].forEach {
            $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case actionButton: delegate?.eventTableViewCell(self, didTapButton: sender)
        default: fatalError("Target not set up properly")
        }
    }
    
    public override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        let style = CKStyle()
        if highlighted {
            stackBackgroundView.backgroundColor = style.color.customGray5
        } else {
            stackBackgroundView.backgroundColor = style.color.customWhite
        }
    }
    
}
