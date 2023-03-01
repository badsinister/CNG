/**
 
 Событие. Контекст данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

struct CNGEventDataContext: CKAnyDataContext {
    
    var model: DSAnyEvent
    
    init(model: DSAnyEvent) {
        self.model = model
    }
    
}
