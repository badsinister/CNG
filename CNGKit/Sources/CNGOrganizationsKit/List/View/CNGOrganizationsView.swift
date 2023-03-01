/**
 
 Список организаций. Вид.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI

/// Протокол поддержки событий вида.
protocol CNGOrganizationsViewDelegate: AnyObject {
    
    func organizationsView(_ organizationsView: CNGOrganizationsView, willShowOrganizationType sender: Any?)
    
    func organizationsView(_ organizationsView: CNGOrganizationsView, willShowTarget sender: Any?)
    
    func organizationsView(_ organizationsView: CNGOrganizationsView, didSelectOrganizationAt indexPath: IndexPath, sender: Any?)
}

/// ```
///     +-------------------------------------------------+
///     |=================================================|
///     | [items]                                 [label] |
///     |=================================================|
///     |                                                 |
///     |                  [ TableView ]                  |
///     |                                                 |
///     |                                                 |
///     +-------------------------------------------------+
/// ```
class CNGOrganizationsView: CKView {
    
    weak var delegate: CNGOrganizationsViewDelegate?

    private let stackView = CKStackView.vertical()
    
    fileprivate let separatorView = CKSeparatorView()
    
    fileprivate let secondSeparatorView = CKSeparatorView()
    
    private let toolbarStackView: CKStackView = {
        let stackView = CKStackView.horizontal()
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    fileprivate let toolbarBackgroundView = {
        let view = CKView()
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return view
    }()

    let quantityLabel = CKLabel(textStyle: .footnote, weight: .regular)
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CNGOrganizationTableViewCell.self, forCellReuseIdentifier: CNGOrganizationTableViewCell.reuseIdentifier)
        tableView.sectionFooterHeight = 0
        tableView.separatorInset = .zero
        return tableView
    }()

    fileprivate let organizationTypeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(CNGOrganizationsView.makeAttributedText("Organization Type", iconName: "chevron.down"), for: .normal)
        return button
    }()
    
    fileprivate let targetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setAttributedTitle(CNGOrganizationsView.makeAttributedText("Target", iconName: "chevron.down"), for: .normal)
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
        [organizationTypeButton, targetButton, spaceView, quantityLabel].forEach { toolbarStackView.addArrangedSubview($0) }
        toolbarStackView.insertSubview(toolbarBackgroundView, at: 0)
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [stackView, separatorView, toolbarStackView, secondSeparatorView, tableView, organizationTypeButton, targetButton, spaceView].forEach {
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
        organizationTypeButton.tintColor = style.color.customGray
        targetButton.tintColor = style.color.customGray
        quantityLabel.textColor = style.color.customGray
        toolbarBackgroundView.backgroundColor = style.color.customWhite
    }
    
    private func setupGestures() {
        tableView.delegate = self
        [organizationTypeButton, targetButton].forEach {
            $0.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        }
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case organizationTypeButton: delegate?.organizationsView(self, willShowOrganizationType: sender)
        case targetButton: delegate?.organizationsView(self, willShowTarget: sender)
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

// MARK: - Cell Delegate

extension CNGOrganizationsView: CNGOrganizationTableViewCellDelegate {

    func organizationTableViewCell(_ organizationTableViewCell: CNGOrganizationTableViewCell, willChangeFavorite sender: Any?) {
        guard let indexPath = tableView.indexPath(for: organizationTableViewCell) else {
            return
        }
        print(indexPath)
    }
    
}

// MARK: - Table Delegate

extension CNGOrganizationsView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        delegate?.organizationsView(self, didSelectOrganizationAt: indexPath, sender: cell)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = CNGSectionHeaderView()
        view.titleLabel.text = tableView.dataSource?.tableView?(tableView, titleForHeaderInSection: section)
        return view
    }

}
