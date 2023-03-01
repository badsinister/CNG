
import UIKit

// Объект который должен быть стилизован.
public protocol CKStylable {
    
    /// Используется для перезагрузки стилей.
    var customStyle: CKStyler? { get set }
    
    /// Returns in order of existence: This object's custom style, the first parent with a custom style, or the default style.
    func style() -> CKStyler
    
    /// Called when the style changes.
    func styleDidChange()
}

/// In order to propagate style through the view hierarchy:
/// 1. Call `styleChildren()` from a `didSet` observer on `customStyle`.
/// 2. Call `styleChildren()` from `removeFromSuperView()`.
/// 3. Call `styleDidChange()` from `didMoveToSuperview()`.
public extension CKStylable where Self: UIView {
    /// Returns in order of existence: This object's custom style, the first parent with a custom style, or the default style.
    func style() -> CKStyler {
        return customStyle ?? getParentCustomStyle() ?? CKStyle()
    }
    
    /// Notify this view and subviews that the style has changed. Guarantees that the outermost view's `styleDidChange` method will be called after
    /// that of inner views.
    func styleChildren() {
        recursiveStyleChildren()
        styleDidChange()
    }
}

private extension UIView {

    // Find the first custom style in the superview hierarchy.
    func getParentCustomStyle() -> CKStyler? {
        guard let superview = superview else { return nil }
        
        // if the view has a custom style, return it
        if let typedSuperview = superview as? CKStylable, let customStyle = typedSuperview.customStyle {
            return customStyle
        }
        
        // else check if the superview has a custom style
        return superview.getParentCustomStyle()
    }
    
    // Recursively notify subviews that the style has changed.
    func recursiveStyleChildren() {
        for view in subviews {
            // Propagate style through any `UIView`s
            guard let typedView = view as? CKStylable & UIView else {
                view.recursiveStyleChildren()
                continue
            }
            
            // Propagate style to subviews that are not the child of a view that has set a custom style
            if typedView.customStyle == nil {
                typedView.recursiveStyleChildren()
                typedView.styleDidChange()
            }
        }
    }
    
}
