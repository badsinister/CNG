/**
 
 Список событий. Вид.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI

/// Протокол поддержки событий вида.
public protocol CNGEventsViewDelegate: AnyObject {
    
    func eventsView(_ eventsView: CNGEventsView, didSelectEventAt indexPath: IndexPath, sender: Any?)
    
}

/// ```
///     +-------------------------------------------------+
///     |                                                 |
///     |                                                 |
///     |                  [ TableView ]                  |
///     |                                                 |
///     |                                                 |
///     +-------------------------------------------------+
/// ```
public class CNGEventsView: CKView {
    
    weak var delegate: CNGEventsViewDelegate?
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.register(CNGEventTableViewCell.self, forCellReuseIdentifier: CNGEventTableViewCell.reuseIdentifier)
        tableView.sectionFooterHeight = 0
        return tableView
    }()
    
    // MARK: - Make View
    
    public override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        styleSubviews()
        setupGestures()
    }
    
    private func addSubviews() {
        addSubview(tableView)
    }
    
    private func constrainSubviews() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(tableView.constraints(equalTo: self))
    }
    
    private func styleSubviews() {
        let style = style()
        tableView.sectionIndexColor = style.color.customRed
        tableView.backgroundColor = style.color.customFill
    }
    
    private func setupGestures() {
        tableView.delegate = self
    }
    
}

// MARK: - Cell Delegate

extension CNGEventsView: CNGEventTableViewCellDelegate {
    
    public func eventTableViewCell(_ eventTableViewCell: CNGEventTableViewCell, didTapButton sender: Any?) {
        guard let indexPath = tableView.indexPath(for: eventTableViewCell) else {
            return
        }
        print(indexPath)
    }
    
}

// MARK: - Table Delegate

extension CNGEventsView: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        delegate?.eventsView(self, didSelectEventAt: indexPath, sender: cell)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = CNGSectionHeaderView()
        view.titleLabel.text = tableView.dataSource?.tableView?(tableView, titleForHeaderInSection: section)
        return view
    }
    
}
