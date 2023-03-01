/**
 
 Выбор специальности.
 Модальное окно.
 
 */

import UIKit
import StoreKit
import CoreKitUI

public protocol CNGSpecialtyPickerViewControllerDelegate: AnyObject {
    
    func specialtyPicker(_ specialtyPicker: UIViewController, didSelectItems specialties: [DSSpecialty]?)
    
}

public class CNGSpecialtyPickerViewController: CKPickerViewController, CKPickerViewControllerDelegate {

    weak var specialtyDelegate: CNGSpecialtyPickerViewControllerDelegate?

    public init(items: [DSSpecialty], selectedItems: [DSSpecialty]? = nil, delegate: CNGSpecialtyPickerViewControllerDelegate? = nil) {
        super.init(title: "Specialty", items: items, selectedItems: selectedItems)
        self.specialtyDelegate = delegate
        self.pickerDelegate = self
    }
    
    public func pickerViewController(_ pickerViewController: UIViewController, didSelectItems selectedItems: [CKAnyPickerItem]?) {
        specialtyDelegate?.specialtyPicker(pickerViewController, didSelectItems: selectedItems as? [DSSpecialty])
    }

}
