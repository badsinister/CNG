/**
 
 Выбор Таргет.
 Модальное окно.
 
 */

import UIKit
import StoreKit
import CoreKitUI

public protocol CNGTargetPickerViewControllerDelegate: AnyObject {
    
    func targetPicker(_ targetPicker: UIViewController, didSelectItems targets: [String]?)
    
}

public class CNGTargetPickerViewController: CKPickerViewController, CKPickerViewControllerDelegate {
    
    weak var targetDelegate: CNGTargetPickerViewControllerDelegate?
    
    public init(items: [String]? = nil, selectedItems: [String]? = nil, delegate: CNGTargetPickerViewControllerDelegate? = nil) {
        var targets = [CNGTarget]()
        items?.forEach { targets.append(CNGTarget(value: $0)) }
        targets += [CNGTarget(value: "All"), CNGTarget(value: "With Target"), CNGTarget(value: "Without Target")]
        super.init(title: "Target", items: targets, selectedItems: selectedItems?.compactMap { CNGTarget(value: $0) })
        self.targetDelegate = delegate
        self.pickerDelegate = self
    }

    public func pickerViewController(_ pickerViewController: UIViewController, didSelectItems selectedItems: [CKAnyPickerItem]?) {
        targetDelegate?.targetPicker(pickerViewController, didSelectItems: selectedItems?.compactMap { $0.text } )
    }

}
