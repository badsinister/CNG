/**
 
 Контакт. Контекст данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

struct CNGContactDataContext: CKAnyDataContext {

    var model: DSContact
    
    init(model: DSContact) {
        self.model = model
    }
    
}
