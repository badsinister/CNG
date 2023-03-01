/**
 
 Создание и обновление вида сценариев.
 
 */

import UIKit
import CoreKitUI
import StoreKit

class CNGScenariosViewSynchronizer: CKAnyViewSynchronizer {
    
    private var dataSource: UICollectionViewDiffableDataSource<DSDataCollection<DSScenario>, DSScenario>! = nil
    private var currentSnapshot: NSDiffableDataSourceSnapshot<DSDataCollection<DSScenario>, DSScenario>! = nil
    
    func makeView() -> CNGScenariosView {
        let view = CNGScenariosView()
        configureDataSource(collectionView: view.collectionView)
        return view
    }
    
    func updateView(_ view: CNGScenariosView, context: CNGScenariosDataContext) {
        currentSnapshot = NSDiffableDataSourceSnapshot<DSDataCollection<DSScenario>, DSScenario>()
        context.model.forEach {
            currentSnapshot.appendSections([$0])
            currentSnapshot.appendItems($0.items)
        }
        dataSource.apply(currentSnapshot, animatingDifferences: true)
    }
    
    func item(for indexPath: IndexPath) -> DSScenario? {
        return dataSource.itemIdentifier(for: indexPath)
    }
    
    private func configureDataSource(collectionView: UICollectionView) {
        dataSource = UICollectionViewDiffableDataSource<DSDataCollection<DSScenario>, DSScenario> (collectionView: collectionView) { (collectionView: UICollectionView, indexPath: IndexPath, scenario: DSScenario) -> UICollectionViewCell? in
            
            // Get a cell of the desired kind.
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CNGScenarioCollectionViewCell.reuseIdentifier, for: indexPath) as? CNGScenarioCollectionViewCell else {
                fatalError("Cannot create new cell")
            }
            // Populate the cell with our item description.
            cell.positionLabel.text = scenario.name
            if let updatedDate = scenario.updatedDate {
                cell.titleLabel.text = "Название"
                cell.detailsLabel.text = "Updated" + ": " + DateFormatter.localizedString(from: updatedDate, dateStyle: .short, timeStyle: .none)
            }

            // Return the cell.
            return cell
        }
        dataSource.supplementaryViewProvider = { [weak self] (collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView? in
            guard let self = self, let snapshot = self.currentSnapshot else { return nil }
            
            // Get a supplementary view of the desired kind.
            guard let titleSupplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CNGScenarioSupplementaryView.reuseIdentifier, for: indexPath) as? CNGScenarioSupplementaryView else {
                fatalError("Cannot create new supplementary")
            }
                
            let collection = snapshot.sectionIdentifiers[indexPath.section]
            titleSupplementaryView.titleLabel.text = collection.title
            
            return titleSupplementaryView
        }
    }
    
}
