/**
 
  Хранилище данных `DSScenario`.
 
 */


import Foundation

extension DSStore {
    
    public func fetchScenarios(query: DSAnyQuery = DSScenarioQuery(), callbackQueue: DispatchQueue = .main, completion: @escaping (Result<[DSAnyScenario], DSStoreError>) -> Void) {
        let scenarios = [
            DSScenario(id: UUID().uuidString, name: "12", group: "2", updatedDate: Date()),
            DSScenario(id: UUID().uuidString, name: "Ап", group: "Сценарии", updatedDate: Date()),
            DSScenario(id: UUID().uuidString, name: "Сценарий", group: "7", updatedDate: Date()),
            DSScenario(id: UUID().uuidString, name: "Сценарий 2", group: "7", updatedDate: Date()),
            DSScenario(id: UUID().uuidString, name: "3", group: "7", updatedDate: Date()),
            DSScenario(id: UUID().uuidString, name: "4", group: "7", updatedDate: Date()),
            DSScenario(id: UUID().uuidString, name: "6", group: "7", updatedDate: Date()),
            DSScenario(id: UUID().uuidString, name: "95", group: "7", updatedDate: Date()),
            DSScenario(id: UUID().uuidString, name: "Сцен", group: "7", updatedDate: Date()),
            DSScenario(id: UUID().uuidString, name: "Врач", group: "7", updatedDate: Date()),
            DSScenario(id: UUID().uuidString, name: "1", group: "7", updatedDate: Date()),
            DSScenario(id: UUID().uuidString, name: "5", group: "7", updatedDate: Date()),
            DSScenario(id: UUID().uuidString, name: "4", group: "Сценарии", updatedDate: Date())
        ]
        completion(.success(scenarios))
    }

    public func fetchPresentations(query: DSAnyQuery = DSPresentationQuery(), callbackQueue: DispatchQueue = .main, completion: @escaping (Result<[DSAnyPresentation], DSStoreError>) -> Void) {
        let presentations = [
            DSPresentation(id: UUID().uuidString, name: "12", slidesCount: "2", updatedDate: Date()),
            DSPresentation(id: UUID().uuidString, name: "Ап", slidesCount: "Сценарии", updatedDate: Date()),
            DSPresentation(id: UUID().uuidString, name: "Сценарий", slidesCount: "7", updatedDate: Date()),
            DSPresentation(id: UUID().uuidString, name: "Сценарий 2", slidesCount: "7", updatedDate: Date()),
            DSPresentation(id: UUID().uuidString, name: "3", slidesCount: "7", updatedDate: Date()),
            DSPresentation(id: UUID().uuidString, name: "4", slidesCount: "7", updatedDate: Date()),
            DSPresentation(id: UUID().uuidString, name: "6", slidesCount: "7", updatedDate: Date()),
            DSPresentation(id: UUID().uuidString, name: "95", slidesCount: "7", updatedDate: Date()),
            DSPresentation(id: UUID().uuidString, name: "Сцен", slidesCount: "7", updatedDate: Date()),
            DSPresentation(id: UUID().uuidString, name: "Врач", slidesCount: "7", updatedDate: Date()),
            DSPresentation(id: UUID().uuidString, name: "1", slidesCount: "7", updatedDate: Date()),
            DSPresentation(id: UUID().uuidString, name: "5", slidesCount: "7", updatedDate: Date()),
            DSPresentation(id: UUID().uuidString, name: "4", slidesCount: "Сценарии", updatedDate: Date())
        ]
        completion(.success(presentations))
    }

}
