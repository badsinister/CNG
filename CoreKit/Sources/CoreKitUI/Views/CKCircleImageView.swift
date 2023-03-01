
import UIKit

open class CKCircleImageView: UIImageView {
    
    private let maskLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        setup()
    }
    
    override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        setup()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        maskLayer.path = CGPath(ellipseIn: bounds, transform: nil)
        maskLayer.backgroundColor = UIColor.black.cgColor
        
        layer.mask = maskLayer
        clipsToBounds = true
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        maskLayer.path = CGPath(ellipseIn: bounds, transform: nil)
    }
}
