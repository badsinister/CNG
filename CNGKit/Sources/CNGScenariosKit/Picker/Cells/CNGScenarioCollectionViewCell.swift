/**
 
 Сценарий.
 
 */

import UIKit
import CoreKitUI

class CNGScenarioCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "CNGScenarioCollectionViewCellIdentifier"
        
    private let stackView = CKStackView.vertical()
    
    private let containerView = CKView()
    
    let imageView = UIImageView(frame: .zero)
    
    var positionLabel: CKLabel = {
        let label = CKLabel(textStyle: .largeTitle, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    let titleLabel = CKLabel(textStyle: .body, weight: .regular)
    let detailsLabel = CKLabel(textStyle: .subheadline, weight: .regular)
    
    private let textStackView = {
        let stackView = CKStackView.vertical()
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
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
        [titleLabel, detailsLabel].forEach { textStackView.addArrangedSubview($0) }
        [imageView, textStackView].forEach { stackView.addArrangedSubview($0) }
        imageView.addSubview(positionLabel)
        containerView.addSubview(stackView)
        addSubview(containerView)
    }
    
    private func constrainSubviews() {
        [containerView, stackView, positionLabel, imageView, detailsLabel].forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        var constraints = containerView.constraints(equalTo: self)
        constraints += stackView.constraints(equalTo: containerView)
        constraints += [
            positionLabel.widthAnchor.constraint(equalTo: positionLabel.heightAnchor),
            positionLabel.heightAnchor.constraint(equalToConstant: 96),
            positionLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            positionLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func styleSubviews() {
        let style = CKStyle()
        backgroundColor = .clear

        textStackView.directionalLayoutMargins = style.dimension.directionalInsets3

        containerView.backgroundColor = style.color.customWhite
        containerView.layer.borderColor = style.color.separator.cgColor
        containerView.layer.borderWidth = style.dimension.separatorHeight
        containerView.layer.cornerRadius = style.dimension.cornerRadius
        containerView.clipsToBounds = true

        positionLabel.backgroundColor = style.color.customFill
        positionLabel.textColor = style.color.customGray
        positionLabel.layer.borderColor = style.color.border.cgColor
        positionLabel.layer.borderWidth = style.dimension.separatorHeight
        positionLabel.layer.cornerRadius = 48
        positionLabel.clipsToBounds = true
        
        detailsLabel.textColor = style.color.customGray
    }

}
