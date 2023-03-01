/**
 
 CKSegmentedControl
 
 */

import UIKit
import ResourcesKit

public class CKSegmentedControl: UISegmentedControl, CKStylable {

    public var customStyle: CKStyler?
    
    public init() {
        super.init(frame: .zero)
        selectedSegmentIndex = 0
        styleDidChange()
    }
    
    public override init(items: [Any]?) {
        super.init(items: items)
        selectedSegmentIndex = 0
        styleDidChange()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    public override func layoutSubviews(){
        super.layoutSubviews()
        
        //MARK: - Configure Background Radius

        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
        
        backgroundColor = style().color.customWhite
        
        //MARK: - Find selectedImageView

        if let selectedImageView = subviews[numberOfSegments] as? UIImageView {

            //MARK: - Configure selectedImageView Color

            selectedImageView.backgroundColor = style().color.customRed
            selectedImageView.image = nil
            
            //MARK: - Configure selectedImageView Inset with SegmentControl

            selectedImageView.bounds = CGRect(x: selectedImageView.bounds.origin.x, y: selectedImageView.bounds.origin.y, width: selectedImageView.bounds.size.width, height: bounds.height)
            
            //MARK: - Configure selectedImageView cornerRadius

            selectedImageView.layer.masksToBounds = true
            selectedImageView.layer.cornerRadius = selectedImageView.bounds.size.height / 2
            
            selectedImageView.layer.removeAnimation(forKey: "SelectionBounds")
            
        }

        for i in 0...(numberOfSegments - 1)  {
            subviews[i].isHidden = true
        }

    }

    public func styleDidChange() {
        let style = style()
        setTitleTextAttributes([.foregroundColor: style.color.customWhite], for: .selected)
        setTitleTextAttributes([NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .subheadline)], for: .normal)
        setTitleTextAttributes([NSAttributedString.Key.foregroundColor: style.color.customGray], for: .normal)
    }

}
