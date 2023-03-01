
import UIKit
import ResourcesKit

/// Горизонтальный разделитель. UIView залитый цветом.
open class CKSeparatorView: CKView {
    
    // MARK: Properties
    
    private var heightConstraint: NSLayoutConstraint?
    
    // MARK: Methods
    
    open override func setup() {
        super.setup()
        constrainSubviews()
        styleDidChange()
    }
    
    private func constrainSubviews() {
        translatesAutoresizingMaskIntoConstraints = false
        heightConstraint = heightAnchor.constraint(equalToConstant: 0)
        heightConstraint?.isActive = true
    }
    
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        styleDidChange()
    }
    
    override open func removeFromSuperview() {
        super.removeFromSuperview()
        styleChildren()
    }
    
    override open func styleDidChange() {
        super.styleDidChange()
        let cachedStyle = style()
        backgroundColor = cachedStyle.color.separator
        heightConstraint?.constant = cachedStyle.dimension.separatorHeight
    }
    
}
