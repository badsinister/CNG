/**
 
  Хранилище данных `DSContact`.
 
 */

import Foundation

extension DSStore {

    public func fetchContacts(query: DSAnyQuery = DSContactQuery(), callbackQueue: DispatchQueue = .main, completion: @escaping (Result<[DSAnyContact], DSStoreError>) -> Void) {
        var nc1 = PersonNameComponents()
        nc1.familyName = "Петров"
        nc1.givenName = "Осечка"
        nc1.middleName = "Водяничка"
        let c1 = DSContact(id: UUID().uuidString, fullName: nc1, isFavorited: true)
        completion(.success([c1]))
    }

    public func fetchContactPositions(query: DSAnyQuery = DSContactQuery(), callbackQueue: DispatchQueue = .main, completion: @escaping (Result<[DSAnyContactPosition], DSStoreError>) -> Void) {
        var nc1 = PersonNameComponents()
        nc1.familyName = "Петров"
        nc1.givenName = "Осечка"
        nc1.middleName = "Водяничка"
        let c1 = DSContact(id: UUID().uuidString, fullName: nc1, isFavorited: true)
        let o1 = DSOrganization(id: UUID().uuidString, name: "Дисней Ленд", postalAddress: DSPostalAddress(street: "Улица Героев без Войны"), type: DSOrganizationType(id: "1", name: "Аптека"), isFavorited: true)

        var nc2 = PersonNameComponents()
        nc2.familyName = "Иванов"
        nc2.givenName = "Оганосян"
        let c2 = DSContact(id: UUID().uuidString, fullName: nc2, isFavorited: true)

        var nc3 = PersonNameComponents()
        nc3.familyName = "Петровка"
        nc3.givenName = "Осечкина"
        nc3.middleName = "ВодяничкаПевичка"
        let c3 = DSContact(id: UUID().uuidString, fullName: nc3, isFavorited: true)
        let o3 = DSOrganization(id: UUID().uuidString, name: "Дисней Ленд", postalAddress: DSPostalAddress(street: "Улица Героев без Войны"), type: DSOrganizationType(id: "1", name: "Аптека"), isFavorited: true)

        completion(.success([DSContactPosition(id: "1", name: "Буча",  contact: c3, organization: o3), DSContactPosition(id: "2", name: "Душа",  contact: c1, organization: o1), DSContactPosition(id: "3", name: "Чепуха с соплями", contact: c2, organization: o1)]))
    }

    public func fetchSpecialties(callbackQueue: DispatchQueue = .main, completion: @escaping (Result<[DSSpecialty], DSStoreError>) -> Void) {
        let specialties = [
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Врач"),
            DSSpecialty(id: UUID().uuidString, name: "Грач"),
            DSSpecialty(id: UUID().uuidString, name: "Драч")
        ]
        completion(.success(specialties))
    }

    public func addContacts(_ contacts: [DSAnyContact], callbackQueue: DispatchQueue = .main, completion: ((Result<[DSAnyContact], DSStoreError>) -> Void)? = nil) {
    }
    
    public func updateContacts(_ contacts: [DSAnyContact], callbackQueue: DispatchQueue = .main, completion: ((Result<[DSAnyContact], DSStoreError>) -> Void)? = nil) {
    }
    
    public func deleteContacts(_ contacts: [DSAnyContact], callbackQueue: DispatchQueue = .main, completion: ((Result<[DSAnyContact], DSStoreError>) -> Void)? = nil) {
    }

}
