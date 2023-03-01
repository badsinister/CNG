/**
 
 Протокол элементов списка.
 
 */

import Foundation

public protocol CKAnyPickerItem {
    
    var id: String { get }
    
    var text: String { get }

    var secondaryText: String? { get }
    
    var groupKey: String? { get }
}
