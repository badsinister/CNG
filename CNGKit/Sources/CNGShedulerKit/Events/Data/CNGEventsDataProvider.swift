/**
 
 Контроллер данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

public class CNGEventsDataProvider: CKAnyDataProvider {
    
    @Published var events: [DSAnyEvent] = []
    
    var store: DSAnyEventsStore
    
    required init(store: DSAnyEventsStore) {
        self.store = store
    }
    
    /// Извлечение данных из хранилища.
    public func fetchData(_ completion: (() -> Void)? = nil) {
        (store as! DSStore).fetchEvents { results in
            switch results {
            case .success(let events):
                self.events = events
            case .failure(let error):
                print(error)
            }
        }
    }

}
