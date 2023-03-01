/**
 
 Контроллер данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

class CNGOrganizationsDataProvider: CKAnyDataProvider {
    
    @Published var organizations: [DSAnyOrganization] = []
    
    var store: DSAnyOrganizationsStore
    
    required init(store: DSAnyOrganizationsStore) {
        self.store = store
    }
    
    /// Извлечение данных из хранилища.
    func fetchData(_ completion: (() -> Void)? = nil) {
        (store as! DSStore).fetchOrganizations { results in
            switch results {
            case .success(let organizations):
                self.organizations = organizations
            case .failure(let error):
                print(error)
            }
        }
    }

}
