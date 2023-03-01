
import UIKit

open class CKView: UIView, CKStylable {

    public var customStyle: CKStyler? {
        didSet { styleChildren() }
    }
    
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    open func setup() {
        preservesSuperviewLayoutMargins = true
        styleDidChange()
    }
    
    open func styleDidChange() {}
    
    override open func didMoveToSuperview() {
        super.didMoveToSuperview()
        styleDidChange()
    }
    
    override open func removeFromSuperview() {
        super.removeFromSuperview()
        styleChildren()
    }

}
