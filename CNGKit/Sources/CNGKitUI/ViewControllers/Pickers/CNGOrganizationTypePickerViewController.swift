/**
 
 Выбор типа организации.
 Модальное окно.
 
 */

import UIKit
import StoreKit
import CoreKitUI

public protocol CNGOrganizationTypePickerViewControllerDelegate: AnyObject {
    
    func organizationTypePicker(_ organizationTypePicker: UIViewController, didSelectItems types: [DSOrganizationType]?)
    
}

public class CNGOrganizationTypePickerViewController: CKPickerViewController, CKPickerViewControllerDelegate {
    
    weak var organizationTypeDelegate: CNGOrganizationTypePickerViewControllerDelegate?
    
    public init(items: [DSOrganizationType], selectedItems: [DSOrganizationType]? = nil, delegate: CNGOrganizationTypePickerViewControllerDelegate? = nil) {
        super.init(title: "Organization Type", items: items, selectedItems: selectedItems)
        self.organizationTypeDelegate = delegate
        self.pickerDelegate = self
    }
    
    public func pickerViewController(_ pickerViewController: UIViewController, didSelectItems selectedItems: [CKAnyPickerItem]?) {
        organizationTypeDelegate?.organizationTypePicker(pickerViewController, didSelectItems: selectedItems as? [DSOrganizationType])
    }
    
}
