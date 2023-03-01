/**
 
 Контроллер данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

public class CNGCreateEventDataProvider: CKAnyDataProvider {
    
    @Published var eventTypes: [DSEventType] = []
    
    var store: DSAnyEventsStore
    
    required init(store: DSAnyEventsStore) {
        self.store = store
    }
    
    /// Извлечение данных из хранилища.
    public func fetchData(_ completion: (() -> Void)? = nil) {
        (store as! DSStore).fetchEventTypes { results in
            switch results {
            case .success(let eventTypes):
                self.eventTypes = eventTypes
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
