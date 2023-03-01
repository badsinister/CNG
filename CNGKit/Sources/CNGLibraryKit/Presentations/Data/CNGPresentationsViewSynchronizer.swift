/**
 
 Создание и обновление вида файлов.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI
import StoreKit

class CNGPresentationsViewSynchronizer: CKAnyViewSynchronizer {

    enum Section {
        case main
    }

    private var dataSource: UICollectionViewDiffableDataSource<Section, DSPresentation>! = nil
    private var currentSnapshot: NSDiffableDataSourceSnapshot<Section, DSPresentation>! = nil
    
    func makeView() -> CNGPresentationsView {
        let view = CNGPresentationsView()
        configureDataSource(collectionView: view.collectionView)
        return view
    }
    
    func updateView(_ view: CNGPresentationsView, context: CNGDataContext<[DSPresentation]>) {
        currentSnapshot = NSDiffableDataSourceSnapshot<Section, DSPresentation>()
        currentSnapshot.appendSections([.main])
        currentSnapshot.appendItems(context.model)
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
    func item(for indexPath: IndexPath) -> DSPresentation? {
        return dataSource.itemIdentifier(for: indexPath)
    }
    
    private func configureDataSource(collectionView: UICollectionView) {
        dataSource = UICollectionViewDiffableDataSource<Section, DSPresentation> (collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, presentation: DSPresentation) -> UICollectionViewCell? in
            
            // Get a cell of the desired kind.
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CNGPresentationCollectionViewCell.reuseIdentifier, for: indexPath) as? CNGPresentationCollectionViewCell else {
                fatalError("Cannot create new cell")
            }
            // Populate the cell with our item description.
            cell.titleLabel.text = presentation.name
            if let updatedDate = presentation.updatedDate {
                cell.detailsLabel.text = "Updated" + ": " + DateFormatter.localizedString(from: updatedDate, dateStyle: .short, timeStyle: .none)
            }
            
            // Return the cell.
            return cell
        }
    }
    
}
