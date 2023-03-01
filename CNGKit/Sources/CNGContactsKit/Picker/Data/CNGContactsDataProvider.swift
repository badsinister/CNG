/**
 
 Контроллер данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

class CNGContactsDataProvider: CKAnyDataProvider {

    @Published var contactPositions: [DSAnyContactPosition] = []

    var store: DSAnyContactsStore
    
    required init(store: DSAnyContactsStore) {
        self.store = store
    }
    
    /// Извлечение данных из хранилища.
    func fetchData(_ completion: (() -> Void)? = nil) {
        (store as! DSStore).fetchContactPositions { results in
            switch results {
            case .success(let contactPositions):
                self.contactPositions = contactPositions
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
