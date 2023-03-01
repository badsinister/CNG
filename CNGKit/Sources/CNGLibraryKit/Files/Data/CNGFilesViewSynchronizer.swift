/**
 
 Создание и обновление вида файлов.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI
import StoreKit

class CNGFilesViewSynchronizer: CKAnyViewSynchronizer {
    
    enum Section {
        case main
    }
    
    private var dataSource: UITableViewDiffableDataSource<Section, DSLibraryEntity>! = nil
    private var currentSnapshot: NSDiffableDataSourceSnapshot<Section, DSLibraryEntity>! = nil
    
    func makeView() -> CNGFilesView {
        let view = CNGFilesView()
        configureDataSource(tableView: view.tableView, delegate: view)
        return view
    }
    
    func updateView(_ view: CNGFilesView, context: CNGDataContext<[DSLibraryEntity]>) {
        currentSnapshot = NSDiffableDataSourceSnapshot<Section, DSLibraryEntity>()
        currentSnapshot.appendSections([.main])
        currentSnapshot.appendItems(context.model)
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
    func item(for indexPath: IndexPath) -> DSLibraryEntity? {
        return dataSource.itemIdentifier(for: indexPath)
    }
    
    private func configureDataSource(tableView: UITableView, delegate: CNGLibraryEntityTableViewCellDelegate) {
        dataSource = UITableViewDiffableDataSource(tableView: tableView) { (tableView: UITableView, indexPath: IndexPath, item: DSLibraryEntity) -> UITableViewCell? in
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CNGLibraryEntityTableViewCell.reuseIdentifier, for: indexPath) as? CNGLibraryEntityTableViewCell else {
                fatalError("Cannot create new cell")
            }
            
            cell.specialtyLabel.text = item.name
            cell.dateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
            cell.delegate = delegate
            
            return cell
        }
        
        dataSource.defaultRowAnimation = .fade
    }
    
}
