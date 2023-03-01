/**
 
 Список сценариев. Вид.
 
 */

import UIKit
import CoreKitUI

/// Протокол поддержки событий вида.
protocol CNGScenariosViewDelegate: AnyObject {
    
    func scenariosView(_ scenariosView: CNGScenariosView, didSelectScenarioAt indexPath: IndexPath, sender: Any?)
    
}

/// ```
///     +------------------------------------------------+
///     |================================================|
///     |                                                |
///     |                                                |
///     |               [ CollectionView ]               |
///     |                                                |
///     |                                                |
///     +------------------------------------------------+
/// ```
class CNGScenariosView: CKView {
    
    weak var delegate: CNGScenariosViewDelegate?
    
    private let stackView = CKStackView.vertical()
    
    fileprivate let separatorView = CKSeparatorView()
    
    public lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CNGScenariosView.makeLayout())
        collectionView.register(CNGScenarioCollectionViewCell.self, forCellWithReuseIdentifier: CNGScenarioCollectionViewCell.reuseIdentifier)
        collectionView.register(CNGScenarioSupplementaryView.self, forSupplementaryViewOfKind: CNGScenarioSupplementaryView.elementKind, withReuseIdentifier: CNGScenarioSupplementaryView.reuseIdentifier)
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Make View
    
    override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        styleSubviews()
    }
    
    private func addSubviews() {
        [separatorView, collectionView].forEach { stackView.addArrangedSubview($0) }
        addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [stackView, separatorView, collectionView].forEach {  $0.translatesAutoresizingMaskIntoConstraints = false }
        NSLayoutConstraint.activate(stackView.constraints(equalTo: self))
    }
    
    private func styleSubviews() {
        collectionView.backgroundColor = .clear
    }
    
    // MARK: - UICollectionView
    
    /// Создание Layout коллекции
    private static func makeLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // if we have the space, adapt and go 2-up + peeking 3rd item
            //let groupFractionalWidth = CGFloat(layoutEnvironment.container.effectiveContentSize.width > 500 ? 0.425 : 0.85)
            //let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(groupFractionalWidth), heightDimension: .absolute(230))
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(214), heightDimension: .absolute(230))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = 20
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20)
            
            //let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
            let titleSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(44))
            let titleSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: titleSize,
                elementKind: CNGScenarioSupplementaryView.elementKind,
                alignment: .top)
            section.boundarySupplementaryItems = [titleSupplementary]
            return section
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
    }
    
}

extension CNGScenariosView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        delegate?.scenariosView(self, didSelectScenarioAt: indexPath, sender: cell)
    }
    
}
