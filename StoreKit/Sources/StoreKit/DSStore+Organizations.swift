/**
 
  Хранилище данных `DSOrganization`.
 
 */

import Foundation

extension DSStore {
    
    public func fetchOrganizations(query: DSAnyQuery = DSOrganizationQuery(), callbackQueue: DispatchQueue = .main, completion: @escaping (Result<[DSAnyOrganization], DSStoreError>) -> Void) {
        var o1 = DSOrganization(id: UUID().uuidString, name: "Дисней Ленд", postalAddress: DSPostalAddress(street: "Улица Героев без Войны"), type: DSOrganizationType(id: "3", name: "Аптека"), isFavorited: true)
        o1.coordinate = .init(latitude: 55.69814175787227, longitude: 37.77618398889898)
        var o2 = DSOrganization(id: UUID().uuidString, name: "Аптека трейд", postalAddress: DSPostalAddress(street: "СанктПитер, Московская 45"), type: DSOrganizationType(id: "3", name: "Больница"), isFavorited: true)
        o2.coordinate = .init(latitude: 59.941633, longitude: 30.276513)
        var o3 = DSOrganization(id: UUID().uuidString, name: "Визор", postalAddress: DSPostalAddress(street: "Фиговинская 84 / 3"), type: DSOrganizationType(id: "2", name: "Аптека"), isFavorited: true)
        o3.coordinate = .init(latitude: 53.128611, longitude: 46.592772)
        let o4 = DSOrganization(id: UUID().uuidString, name: "Контора пишет", postalAddress: DSPostalAddress(street: "Улица Героев"), type: DSOrganizationType(id: "1", name: "Санитариум"), isFavorited: true)
        completion(.success([o1, o2, o3, o4]))
    }
    
    public func fetchOrganizationTypes(query: DSAnyQuery = DSOrganizationQuery(), callbackQueue: DispatchQueue = .main, completion: @escaping (Result<[DSOrganizationType], DSStoreError>) -> Void) {
        let t1 = DSOrganizationType(id: "3", name: "Аптека снова")
        let t2 = DSOrganizationType(id: "3", name: "Больница")
        let t3 = DSOrganizationType(id: "2", name: "Аптека")
        let t4 = DSOrganizationType(id: "1", name: "Санитариум")
        completion(.success([t1, t2, t3, t4]))
    }

    public func addOrganizations(_ organizations: [DSAnyOrganization], callbackQueue: DispatchQueue = .main, completion: ((Result<[DSAnyOrganization], DSStoreError>) -> Void)? = nil) {
    }
    
    public func updateOrganizations(_ organizations: [DSAnyOrganization], callbackQueue: DispatchQueue = .main, completion: ((Result<[DSAnyOrganization], DSStoreError>) -> Void)? = nil) {
    }
    
    public func deleteOrganizations(_ organizations: [DSAnyOrganization], callbackQueue: DispatchQueue = .main, completion: ((Result<[DSAnyOrganization], DSStoreError>) -> Void)? = nil) {
    }

}
