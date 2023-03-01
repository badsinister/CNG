/**
 
 Контроллер данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

class CNGContactDataProvider: CKAnyDataProvider {
    
    @Published var contact: DSAnyContact? = nil
    
    private var store: DSStore
    
    init(contactID: String, store: DSStore) {
        self.store = store
    }
    
    /// Извлечение данных из хранилища.
    func fetchData(_ completion: (() -> Void)? = nil) {
        store.fetchContact(withID: "") { result in
            switch result {
            case .success(let contact):
                self.contact = contact
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
