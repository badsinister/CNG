/**
 
 Список контактов. Вид.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI

/// Протокол поддержки событий вида.
protocol CNGContactsViewDelegate: AnyObject {
    
    func contactsView(_ contactsView: CNGContactsView, willShowSpeciality sender: Any?)

    func contactsView(_ contactsView: CNGContactsView, willShowOrganizationType sender: Any?)

    func contactsView(_ contactsView: CNGContactsView, willShowTarget sender: Any?)

    func contactsView(_ contactsView: CNGContactsView, didSelectContactAt indexPath: IndexPath, sender: Any?)

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
class CNGContactsView: CKView {
    
    weak var delegate: CNGContactsViewDelegate?
    
    private let stackView = CKStackView.vertical()
    
    fileprivate let separatorView = CKSeparatorView()
    
    fileprivate let secondSeparatorView = CKSeparatorView()
    
    private let toolbarStackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    fileprivate let toolbarBackgroundView: CKView = {
        let view = CKView()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()
    
    let quantityLabel = CKLabel(textStyle: .subheadline, weight: .regular)
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CNGContactTableViewCell.self, forCellReuseIdentifier: CNGContactTableViewCell.reuseIdentifier)
        tableView.sectionFooterHeight = 0
        tableView.separatorInset = .zero
        return tableView
    }()
    
    fileprivate let specialityButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(CNGContactsView.makeAttributedText("Speciality", iconName: "chevron.down"), for: .normal)
        return button
    }()
    
    fileprivate let organizationTypeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(CNGContactsView.makeAttributedText("Organization Type", iconName: "chevron.down"), for: .normal)
        return button
    }()
    
    fileprivate let targetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(CNGContactsView.makeAttributedText("Target", iconName: "chevron.down"), for: .normal)
        return button
    }()
    
    private let spaceView = CKView()
    
    // MARK: - Make View
    
    override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        styleSubviews()
        setupGestures()
    }
    
    private func addSubviews() {
        [separatorView, toolbarStackView, secondSeparatorView, tableView].forEach { stackView.addArrangedSubview($0) }
        [specialityButton, organizationTypeButton, targetButton, spaceView, quantityLabel].forEach { toolbarStackView.addArrangedSubview($0) }
        toolbarStackView.insertSubview(toolbarBackgroundView, at: 0)
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [stackView, separatorView, toolbarStackView, secondSeparatorView, tableView, specialityButton, organizationTypeButton, targetButton, spaceView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate(stackView.constraints(equalTo: self))
    }
    
    private func styleSubviews() {
        let style = style()
        toolbarStackView.directionalLayoutMargins = style.dimension.directionalInsets2
        toolbarStackView.spacing = style.dimension.spacing3
        tableView.sectionIndexColor = style.color.customRed
        tableView.backgroundColor = .clear
        tableView.separatorColor = style.color.separator
        specialityButton.tintColor = style.color.customGray
        organizationTypeButton.tintColor = style.color.customGray
        targetButton.tintColor = style.color.customGray
        quantityLabel.textColor = style.color.customGray
        toolbarBackgroundView.backgroundColor = style.color.customWhite
    }
    
    private func setupGestures() {
        tableView.delegate = self
        [specialityButton, organizationTypeButton, targetButton].forEach {
            $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case specialityButton: delegate?.contactsView(self, willShowSpeciality: sender)
        case organizationTypeButton: delegate?.contactsView(self, willShowOrganizationType: sender)
        case targetButton: delegate?.contactsView(self, willShowTarget: sender)
        default: fatalError("Target not set up properly")
        }
    }
    
    private static func makeAttributedText(_ text: String, iconName: String) -> NSAttributedString {
        let iconAttachment = NSTextAttachment()
        iconAttachment.image = UIImage(systemName: iconName, withConfiguration: UIImage.SymbolConfiguration(pointSize: 10, weight: .bold))?.withRenderingMode(.alwaysTemplate)
        let string = NSMutableAttributedString(attachment: iconAttachment)
        string.insert(NSAttributedString(string: "\(text) "), at: 0)
        return string
    }
}

extension CNGContactsView: CNGContactTableViewCellDelegate {

    func contactTableViewCell(_ contactTableViewCell: CNGContactTableViewCell, willChangeFavorite sender: Any?) {
        guard let indexPath = tableView.indexPath(for: contactTableViewCell) else {
            return
        }
        print(indexPath)
    }
    
    func contactTableViewCell(_ contactTableViewCell: CNGContactTableViewCell, willAddEvent sender: Any?) {
        guard let indexPath = tableView.indexPath(for: contactTableViewCell) else {
            return
        }
        print(indexPath)
    }
    
}

extension CNGContactsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        delegate?.contactsView(self, didSelectContactAt: indexPath, sender: cell)
        print(indexPath)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = CNGSectionHeaderView()
        view.titleLabel.text = tableView.dataSource?.tableView?(tableView, titleForHeaderInSection: section)
        return view
    }

}
