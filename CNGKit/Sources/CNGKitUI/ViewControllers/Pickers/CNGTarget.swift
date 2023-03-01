/**
 
 Таргет.
 
 */

import UIKit
import CoreKitUI

/// Тергет. Содержит текстовое значение.
public struct CNGTarget: CKAnyPickerItem {

    public var id: String = UUID().uuidString
    public var text: String
    public var secondaryText: String? = nil
    public var groupKey: String? = nil
    
    init(value: String) {
        self.text = value
    }

}
