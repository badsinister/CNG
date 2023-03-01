/**
 
 Список Презентаций. Вид.
 
 */

import UIKit
import CoreKitUI

/// Протокол поддержки событий вида.
protocol CNGPresentationsViewDelegate: AnyObject {
    
    func presentationsView(_ presentationsView: CNGPresentationsView, didSelectPresentationAt indexPath: IndexPath, sender: Any?)
    
}

/// ```
///     +------------------------------------------+
///     |                                          |
///     |                                          |
///     |            [ CollectionView ]            |
///     |                                          |
///     |                                          |
///     +------------------------------------------+
/// ```
class CNGPresentationsView: CKView {
    
    weak var delegate: CNGPresentationsViewDelegate?
    
    private let stackView = CKStackView.vertical()
    
    fileprivate let separatorView = CKSeparatorView()
    
    public lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: CNGPresentationsView.makeLayout())
        collectionView.register(CNGPresentationCollectionViewCell.self, forCellWithReuseIdentifier: CNGPresentationCollectionViewCell.reuseIdentifier)
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
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25)/*.absolute(214)*/, heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(230))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
}

extension CNGPresentationsView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        delegate?.presentationsView(self, didSelectPresentationAt: indexPath, sender: cell)
    }
    
}
