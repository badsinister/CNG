/**
 
 Создание и обновление вида контактов.
 
 */

import UIKit
import StoreKit
import CoreKitUI

class CNGContactsViewSynchronizer: CKAnyViewSynchronizer {
    
    private var dataSource: CNGContactsDiffableDataSource! = nil
    private var currentSnapshot: NSDiffableDataSourceSnapshot<DSDataCollection<DSContactPosition>, DSContactPosition>! = nil
    
    func makeView() -> CNGContactsView {
        let view = CNGContactsView()
        configureDataSource(tableView: view.tableView, delegate: view)
        return view
    }
    
    func updateView(_ view: CNGContactsView, context: CNGContactsDataContext) {
        view.quantityLabel.text = "2 of 2"
        guard let groupedModel = context.groupedModel else {
            return
        }
        currentSnapshot = NSDiffableDataSourceSnapshot<DSDataCollection<DSContactPosition>, DSContactPosition>()
        groupedModel.forEach {
            currentSnapshot.appendSections([$0])
            currentSnapshot.appendItems($0.items)
        }
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }

    func item(for indexPath: IndexPath) -> DSContactPosition? {
        return dataSource.itemIdentifier(for: indexPath)
    }

    private func configureDataSource(tableView: UITableView, delegate: CNGContactTableViewCellDelegate) {
        dataSource = CNGContactsDiffableDataSource(tableView: tableView) { (tableView: UITableView, indexPath: IndexPath, item: DSContactPosition) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CNGContactTableViewCell.reuseIdentifier, for: indexPath) as? CNGContactTableViewCell else {
                fatalError("Cannot create new cell")
            }
            
            cell.nameLabel.text = PersonNameComponentsFormatter.localizedString(from: item.contact.fullName, style: .default)
            cell.specialtyLabel.text = item.name
            cell.organizationLabel.text = item.organization.name
            cell.addressLabel.text = item.organization.postalAddress?.street
            cell.favoriteButton.setImage(UIImage(systemName: "star.fill")!, for: .normal)
            cell.dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
            cell.delegate = delegate
            
            return cell
        }
        
        dataSource.defaultRowAnimation = .fade
    }
    
}

/// Переопределение источника данных для вывода заголовка секции.
class CNGContactsDiffableDataSource: UITableViewDiffableDataSource<DSDataCollection<DSContactPosition>, DSContactPosition> {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return snapshot().sectionIdentifiers[section].title?.uppercased()
    }
    
}
