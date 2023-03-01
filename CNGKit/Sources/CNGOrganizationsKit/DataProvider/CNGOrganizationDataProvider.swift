/**
 
 Контроллер данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit
import MapKit

class CNGOrganizationDataProvider: CKAnyDataProvider {
    
    @Published var organization: DSAnyOrganization? = nil
    
    @Published var coordinate: CLLocationCoordinate2D? = nil
    
    /// Хранилище данных.
    private var store: DSAnyOrganizationsStore
    
    /// Создание контроллера данных для организации.
    /// - Parameters:
    ///   - organization: Организация.
    ///   - store: Хранилище данных.
    init(with organization: DSAnyOrganization, store: DSAnyOrganizationsStore) {
        self.organization = organization
        self.store = store
    }
    
    /// Создание контроллера данных для организации по идентификатору.
    /// - Parameters:
    ///   - id: Уникальный идентификатор организации.
    ///   - store: Хранилище данных.
    init(withID id: String, store: DSAnyOrganizationsStore) {
        self.store = store
        store.fetchOrganization(withID: id) { [weak self] result in
            switch result {
            case .success(let organization):
                self?.organization = organization
            case .failure(let error):
                print(error)
            }
        }
    }

    /// Извлечение данных из хранилища.
    func fetchData(_ completion: (() -> Void)? = nil) {
        
    }
    
    /// Поиск географических координат по адресу организации.
    func fetchLocation() {
        guard let address = organization?.postalAddress?.street else {
            return
        }
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = address
        
        let localSearch = MKLocalSearch(request: searchRequest)
        localSearch.start { [weak self] (response, error) in
            guard let response = response else {
                if let error = error { print(error) }
                return
            }
            print(response.mapItems)
            self?.coordinate = response.mapItems.first?.placemark.location?.coordinate
        }
    }
    
}
