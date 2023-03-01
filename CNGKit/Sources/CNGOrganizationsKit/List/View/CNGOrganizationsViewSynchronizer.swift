/**
 
 Создание и обновление вида списка организаций.
 
 */

import UIKit
import StoreKit
import CoreKitUI

class CNGOrganizationsViewSynchronizer: CKAnyViewSynchronizer {
    
    private var dataSource: CNGOrganizationsDiffableDataSource! = nil
    private var currentSnapshot: NSDiffableDataSourceSnapshot<DSDataCollection<DSOrganization>, DSOrganization>! = nil
    
    func makeView() -> CNGOrganizationsView {
        let view = CNGOrganizationsView()
        configureDataSource(tableView: view.tableView, delegate: view)
        return view
    }
    
    func updateView(_ view: CNGOrganizationsView, context: CNGOrganizationsDataContext) {
        view.quantityLabel.text = "2 of 2"
        currentSnapshot = NSDiffableDataSourceSnapshot<DSDataCollection<DSOrganization>, DSOrganization>()
        context.model.forEach {
            currentSnapshot.appendSections([$0])
            currentSnapshot.appendItems($0.items)
        }
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
    func item(for indexPath: IndexPath) -> DSOrganization? {
        return dataSource.itemIdentifier(for: indexPath)
    }

    private func configureDataSource(tableView: UITableView, delegate: CNGOrganizationTableViewCellDelegate) {
        dataSource = CNGOrganizationsDiffableDataSource(tableView: tableView) { (tableView: UITableView, indexPath: IndexPath, item: DSOrganization) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CNGOrganizationTableViewCell.reuseIdentifier, for: indexPath) as? CNGOrganizationTableViewCell else {
                fatalError("Cannot create new cell")
            }
            
            cell.organizationLabel.text = item.name
            cell.addressLabel.text = item.postalAddress?.street
            cell.favoriteButton.setImage(UIImage(systemName: "star.fill")!, for: .normal)
            cell.dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
            cell.delegate = delegate
            
            return cell
        }
        dataSource.defaultRowAnimation = .fade
    }

}

/// Переопределение источника данных для вывода заголовка секции.
class CNGOrganizationsDiffableDataSource: UITableViewDiffableDataSource<DSDataCollection<DSOrganization>, DSOrganization> {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return snapshot().sectionIdentifiers[section].title?.uppercased()
    }
    
}
