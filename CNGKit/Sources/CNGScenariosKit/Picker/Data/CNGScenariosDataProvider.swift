/**
 
 Контроллер данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

class CNGScenariosDataProvider: CKAnyDataProvider {

    @Published var scenarios: [DSAnyScenario] = []
    
    private var store: DSAnyActionsStore
    
    required init(store: DSAnyActionsStore) {
        self.store = store
    }
    
    /// Извлечение данных из хранилища.
    func fetchData(_ completion: (() -> Void)? = nil) {
        (store as! DSStore).fetchScenarios(completion: { result in
            switch result {
            case .success(let scenarios):
                self.scenarios = scenarios
            case .failure(let error):
                print(error)
            }
        })
    }
    
}
