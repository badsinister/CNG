/**
 
 Элементы списков.
 
 */

import Foundation
import StoreKit
import CoreKitUI

extension DSSpecialty: CKAnyPickerItem {
    
    public var text: String { return name }
    public var secondaryText: String? { return nil }
    public var groupKey: String? { return nil } //String(name.uppercased().prefix(1))
    
}

extension DSOrganizationType: CKAnyPickerItem {

    public var text: String { return name }
    public var secondaryText: String? { return nil }
    public var groupKey: String? { return String(name.uppercased().prefix(1)) }

}
