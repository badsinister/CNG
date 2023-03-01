/**
 
 Список файлов. Вид.
 
 */

import UIKit
import CoreKitUI

/// Протокол поддержки событий вида.
protocol CNGFilesViewDelegate: AnyObject {
    
    func filesView(_ libraryView: CNGFilesView, didSelectPositionAt indexPath: IndexPath)
    
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
class CNGFilesView: CKView {
    
    weak var delegate: CNGFilesViewDelegate?
    
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CNGLibraryEntityTableViewCell.self, forCellReuseIdentifier: CNGLibraryEntityTableViewCell.reuseIdentifier)
        tableView.sectionFooterHeight = 0
        tableView.separatorInset = .zero
        return tableView
    }()

    // MARK: - Make View
    
    override func setup() {
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
        tableView.backgroundColor = .clear
    }
    
    private func setupGestures() {
        tableView.delegate = self
    }
    
}

extension CNGFilesView: CNGLibraryEntityTableViewCellDelegate {

    func libraryEntityTableViewCell(_ libraryEntityTableViewCell: CNGLibraryEntityTableViewCell, willShowActions sender: Any?) {
        guard let indexPath = tableView.indexPath(for: libraryEntityTableViewCell) else {
            return
        }
        print(indexPath)
    }
    
}

extension CNGFilesView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell = tableView.cellForRow(at: indexPath)
        delegate?.filesView(self, didSelectPositionAt: indexPath)
        print(indexPath)
    }
    
}
