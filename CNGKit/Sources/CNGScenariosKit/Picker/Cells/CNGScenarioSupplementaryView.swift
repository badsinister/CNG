/**
 
 Заголовок секции.
 
 */

import UIKit
import CoreKitUI

class CNGScenarioSupplementaryView: UICollectionReusableView {
    
    let titleLabel = CKLabel(textStyle: .body, weight: .regular)
    
    static let reuseIdentifier = "CNGScenariosSupplementaryViewIdentifier"

    static let elementKind = "CNGScenariosCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        addSubviews()
        constrainSubviews()
        styleSubviews()
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
    }
    
    private func constrainSubviews() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(titleLabel.constraints(equalTo: self))
    }
    
    private func styleSubviews() {
        backgroundColor = .clear
    }

}
