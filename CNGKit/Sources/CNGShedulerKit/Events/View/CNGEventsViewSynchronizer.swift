/**
 
 Создание и обновление вида списка событий.
 
 */

import UIKit
import StoreKit
import CoreKitUI

public class CNGEventsViewSynchronizer: CKAnyViewSynchronizer {
    
    private var dataSource: CNGEventsDiffableDataSource! = nil
    private var currentSnapshot: NSDiffableDataSourceSnapshot<DSDataCollection<DSEvent>, DSEvent>! = nil
    
    public func makeView() -> CNGEventsView {
        let view = CNGEventsView()
        configureDataSource(tableView: view.tableView, delegate: view)
        return view
    }
    
    public func updateView(_ view: CNGEventsView, context: CNGEventsDataContext) {
        currentSnapshot = NSDiffableDataSourceSnapshot<DSDataCollection<DSEvent>, DSEvent>()
        context.model.forEach {
            currentSnapshot.appendSections([$0])
            currentSnapshot.appendItems($0.items)
        }
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
    func item(for indexPath: IndexPath) -> DSEvent? {
        return dataSource.itemIdentifier(for: indexPath)
    }
    
    private func configureDataSource(tableView: UITableView, delegate: CNGEventTableViewCellDelegate) {
        dataSource = CNGEventsDiffableDataSource(tableView: tableView) { (tableView: UITableView, indexPath: IndexPath, item: DSEvent) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CNGEventTableViewCell.reuseIdentifier, for: indexPath) as? CNGEventTableViewCell else {
                fatalError("Cannot create new cell")
            }
            
            cell.iconView.style = .contact
            cell.titleLabel.text = "Событие"
            cell.subtitleLabel.text = "Место проведения"
            cell.actionButton.setImage(UIImage(systemName: "play.circle")!, for: .normal)
            cell.dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
            cell.delegate = delegate
            
            return cell
        }
        
        dataSource.defaultRowAnimation = .fade
    }
    
}

/// Переопределение источника данных для вывода заголовка секции.
class CNGEventsDiffableDataSource: UITableViewDiffableDataSource<DSDataCollection<DSEvent>, DSEvent> {
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return snapshot().sectionIdentifiers[section].title
    }
    
}
