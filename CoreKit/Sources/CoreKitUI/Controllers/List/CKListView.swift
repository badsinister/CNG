/**
 
 Список элементов размещенных в UIScrollView.
 
 */

import UIKit

internal class CKListView: CKView {
    
    override var backgroundColor: UIColor? {
        didSet {
            contentView.backgroundColor = backgroundColor
            scrollView.backgroundColor = backgroundColor
        }
    }
    
    // MARK: Properties
    
    /// The stack view embedded inside the scroll view.
    let stackView = CKStackView.vertical()
    
    /// The scroll view that contains the stack view.
    let scrollView = UIScrollView()
    
    let contentView = UIView()
    
    // MARK: - Life Cycle
    
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: Methods
    
    override func setup() {
        addSubviews()
        styleSubviews()
        constrainSubviews()
    }
    
    private func styleSubviews() {
        scrollView.alwaysBounceVertical = true
    }
    
    private func addSubviews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
    }
    
    private func constrainSubviews() {
        [scrollView, contentView, stackView].forEach { $0?.translatesAutoresizingMaskIntoConstraints = false }
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ] + scrollView.constraints(equalTo: self) +
                                    contentView.constraints(equalTo: scrollView))
    }
    
    override func styleDidChange() {
        super.styleDidChange()
        let style = style()
        contentView.directionalLayoutMargins = style.dimension.directionalInsets2
        backgroundColor = style.color.customBackground
        stackView.spacing = style.dimension.spacing2
    }
}
