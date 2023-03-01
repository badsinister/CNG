/**
 
 Контроллер данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

class CNGLibraryDataProvider: CKAnyDataProvider {

    @Published var entities: [DSAnyLibraryEntity] = []
    @Published var presentations: [DSAnyPresentation] = []

    var store: DSAnyStore
    
    required init(store: DSAnyLibraryStore) {
        self.store = store
    }
    
    /// Извлечение данных из хранилища.
    func fetchEntities(_ completion: (() -> Void)? = nil) {
        (store as! DSStore).fetchEntities(completion: { result in
            switch result {
            case .success(let entities):
                self.entities = entities
            case .failure(let error):
                print(error)
            }
        })
    }

    /// Извлечение данных из хранилища.
    func fetchPresentations(_ completion: (() -> Void)? = nil) {
        (store as! DSStore).fetchPresentations(completion: { result in
            switch result {
            case .success(let presentations):
                self.presentations = presentations
            case .failure(let error):
                print(error)
            }
        })
    }
    
}
