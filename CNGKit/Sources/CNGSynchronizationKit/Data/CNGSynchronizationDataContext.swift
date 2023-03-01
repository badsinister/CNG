/**
 
 Состояние синхронизации.
 Контекст данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

struct CNGSynchronizationDataContext: CKAnyDataContext {
    
    var model: [CNGSynchronizationState] = []

    /// Дата последней синхронизации. Nil если синхронизация не проводилась.
    var synchronizationDate: Date? = nil

}
