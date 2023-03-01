/**
 
 Событие. Контроллер данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

class CNGEventDataProvider: CKAnyDataProvider {
    
    @Published var event: DSAnyEvent? = nil
    
    var title: String? {
        return event?.title ?? "Event"
    }
    
    private var store: DSStore
    
    init(contactID: String, store: DSStore) {
        self.store = store
    }
    
    /// Извлечение данных из хранилища.
    func fetchData(_ completion: (() -> Void)? = nil) {
        store.fetchEvent(withID: "") { result in
            switch result {
            case .success(let event):
                self.event = event
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
