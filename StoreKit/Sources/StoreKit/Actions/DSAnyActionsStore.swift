/**
 
 Сценарии, Презентации. Хранилище данных.
 
 */

import Foundation

/// Хранилище данных соответствующих протоколам типа `DSAnyScenario` и `DSAnyPresentation`.
public protocol DSAnyReadOnlyActionsStore: DSAnyStore {
    
    /// `fetchScenarios` извлекает из хранилища массив данных `DSAnyScenario`.
    /// - Parameters:
    ///   - query: Параметры запроса. Определяются протоколом `DSAnyQuery`.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchScenarios(query: DSAnyQuery, callbackQueue: DispatchQueue, completion: @escaping (Result<[DSAnyScenario], DSStoreError>) -> Void)
    
    // MARK: - Singular methods
    
    /// `fetchScenario` извлекает из хранилища сценарий `DSAnyScenario` для заданного идентификатора.
    /// - Parameters:
    ///   - id: Уникальный идентификатор сценария.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchScenario(withID id: String, callbackQueue: DispatchQueue, completion: @escaping (Result<DSAnyScenario, DSStoreError>) -> Void)
    
    // MARK: - Presentation
    
    /// `fetchPresentations` извлекает из хранилища массив данных `DSAnyPresentation`.
    /// - Parameters:
    ///   - query: Параметры запроса. Определяются протоколом `DSAnyQuery`.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchPresentations(query: DSAnyQuery, callbackQueue: DispatchQueue, completion: @escaping (Result<[DSAnyPresentation], DSStoreError>) -> Void)
    
    // MARK: - Singular methods
    
    /// `fetchPresentation` извлекает из хранилища презентацию `DSAnyPresentation` для заданного идентификатора.
    /// - Parameters:
    ///   - id: Уникальный идентификатор презентации.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchPresentation(withID id: String, callbackQueue: DispatchQueue, completion: @escaping (Result<DSAnyPresentation, DSStoreError>) -> Void)
    
}

/// Хранилище данных соответствующих протоколам типа `DSAnyScenario` и `DSAnyPresentation`.
public protocol DSAnyActionsStore: DSAnyReadOnlyActionsStore {
/*
    /// `addScenarios` асинхронно добавляет в хранилище список контактов `DSAnyScenario`.
    /// - Parameters:
    ///   - contacts: Массив контактов для добавления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func addScenarios(_ scenarios: [DSAnyScenario], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyScenario], DSStoreError>) -> Void)?)
    
    /// `updateScenarios` асинхронно обновляет в хранилища список контактов `DSAnyScenario`.
    /// - Parameters:
    ///   - contacts: Массив контактов для изменения.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func updateScenarios(_ scenarios: [DSAnyScenario], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyScenario], DSStoreError>) -> Void)?)
    
    /// `deleteScenarios` асинхронно удаляет из хранилища список контактов `DSAnyScenario`.
    /// - Parameters:
    ///   - contacts: Массив контактов для удаления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func deleteScenarios(_ scenarios: [DSAnyScenario], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyScenario], DSStoreError>) -> Void)?)
    
    // MARK: - Singular methods
    
    /// `addScenario` асинхронно добавляет в хранилище контакт `DSAnyScenario`.
    /// - Parameters:
    ///   - contact: Контакт для добавления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func addScenario(_ scenario: DSAnyScenario, callbackQueue: DispatchQueue, completion: ((Result<DSAnyScenario, DSStoreError>) -> Void)?)
    
    /// `updateScenario` асинхронно обновляет в хранилища контакт `DSAnyScenario`.
    /// - Parameters:
    ///   - contact: Контакт для изменения.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func updateScenario(_ scenario: DSAnyScenario, callbackQueue: DispatchQueue, completion: ((Result<DSAnyScenario, DSStoreError>) -> Void)?)
    
    /// `deleteScenario` асинхронно удаляет из хранилища контакт `DSAnyScenario`.
    /// - Parameters:
    ///   - contact: Контакт для удаления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func deleteScenario(_ scenario: DSAnyScenario, callbackQueue: DispatchQueue, completion: ((Result<DSAnyScenario, DSStoreError>) -> Void)?)
 */
}

// MARK: - Персональный метод для `DSAnyReadOnlyActionsStore`

extension DSAnyReadOnlyActionsStore {
    
    public func fetchScenario(withID id: String, callbackQueue: DispatchQueue, completion: @escaping (Result<DSAnyScenario, DSStoreError>) -> Void) {
        var query = DSContactQuery()
        query.ids = [id]
        
        fetchScenarios(query: query, callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let scenarios):
                if let first = scenarios.first { completion(.success(first)); return }
                completion(.failure(.fetchFailed(reason: "No scenario with matching ID")))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func fetchPresentation(withID id: String, callbackQueue: DispatchQueue, completion: @escaping (Result<DSAnyPresentation, DSStoreError>) -> Void) {
        var query = DSPresentationQuery()
        query.ids = [id]
        
        fetchPresentations(query: query, callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let presentations):
                if let first = presentations.first { completion(.success(first)); return }
                completion(.failure(.fetchFailed(reason: "No presentation with matching ID")))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
/*
// MARK: - Персональные методы для `DSAnyActionsStore`

extension DSAnyActionsStore {
    
    public func addScenario(_ scenario: DSAnyScenario, callbackQueue: DispatchQueue, completion: ((Result<DSAnyScenario, DSStoreError>) -> Void)?) {
        addScenarios([scenario], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let scenarios):
                if let first = scenarios.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to add scenario")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    public func updateScenario(_ scenario: DSAnyScenario, callbackQueue: DispatchQueue, completion: ((Result<DSAnyScenario, DSStoreError>) -> Void)?) {
        updateScenarios([scenario], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let scenarios):
                if let first = scenarios.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to update scenario")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    public func deleteScenario(_ scenario: DSAnyScenario, callbackQueue: DispatchQueue, completion: ((Result<DSAnyScenario, DSStoreError>) -> Void)?) {
        deleteScenarios([scenario], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let scenarios):
                if let first = scenarios.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to delete scenario")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
}
*/
