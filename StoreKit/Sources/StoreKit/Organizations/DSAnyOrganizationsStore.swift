/**
 
 Хранилище данных типа организация.
 
 */

import Foundation

/// Хранилище данных соответствующих протоколу типа `DSAnyOrganization`.
public protocol DSAnyReadOnlyOrganizationsStore: DSAnyStore {
    
    /// `fetchOrganizations` извлекает из хранилища массив данных `DSAnyOrganization`.
    /// - Parameters:
    ///   - query: Параметры запроса. Определяются протоколом `DSAnyQuery`.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchOrganizations(query: DSAnyQuery, callbackQueue: DispatchQueue, completion: @escaping (Result<[DSAnyOrganization], DSStoreError>) -> Void)
    
    // MARK: - Singular methods
    
    /// `fetchOrganization` извлекает из хранилища `DSAnyOrganization` для заданного идентификатора.
    /// - Parameters:
    ///   - id: Уникальный идентификатор организации.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchOrganization(withID id: String, callbackQueue: DispatchQueue, completion: @escaping (Result<DSAnyOrganization, DSStoreError>) -> Void)
    
    // MARK: - Organization Type
    
    /// `fetchOrganizationTypes` извлекает из хранилища массив данных `DSAnyOrganizationTypes`.
    /// - Parameters:
    ///   - query: Параметры запроса. Определяются протоколом `DSAnyQuery`.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchOrganizationTypes(query: DSAnyQuery, callbackQueue: DispatchQueue, completion: @escaping (Result<[DSOrganizationType], DSStoreError>) -> Void)
    
    // MARK: - Singular methods
    
    /// `fetchOrganization` извлекает из хранилища `fetchOrganizationType` для заданного идентификатора.
    /// - Parameters:
    ///   - id: Уникальный идентификатор организации.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchOrganizationType(withID id: String, callbackQueue: DispatchQueue, completion: @escaping (Result<DSAnyOrganizationType, DSStoreError>) -> Void)
}

/// Хранилище данных соответствующих протоколу типа `DSAnyOrganization`.
public protocol DSAnyOrganizationsStore: DSAnyReadOnlyOrganizationsStore {
    
    /// `addOrganizations` асинхронно добавляет в хранилище список организаций `DSAnyOrganization`.
    /// - Parameters:
    ///   - organizations: Массив организаций для добавления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func addOrganizations(_ organizations: [DSAnyOrganization], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyOrganization], DSStoreError>) -> Void)?)
    
    /// `updateOrganizations` асинхронно обновляет в хранилища список организаций `DSAnyOrganization`.
    /// - Parameters:
    ///   - organizations: Массив организаций для изменения.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func updateOrganizations(_ organizations: [DSAnyOrganization], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyOrganization], DSStoreError>) -> Void)?)
    
    /// `deleteOrganizations` асинхронно удаляет из хранилища список организаций `DSAnyOrganization`.
    /// - Parameters:
    ///   - organizations: Массив организаций для удаления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func deleteOrganizations(_ organizations: [DSAnyOrganization], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyOrganization], DSStoreError>) -> Void)?)
    
    // MARK: - Singular methods
    
    /// `addOrganization` асинхронно добавляет в хранилище контакт `DSAnyOrganization`.
    /// - Parameters:
    ///   - organization: Организация для добавления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func addOrganization(_ organization: DSAnyOrganization, callbackQueue: DispatchQueue, completion: ((Result<DSAnyOrganization, DSStoreError>) -> Void)?)
    
    /// `updateOrganization` асинхронно обновляет в хранилища контакт `DSAnyOrganization`.
    /// - Parameters:
    ///   - organization: Организация для изменения.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func updateOrganization(_ organization: DSAnyOrganization, callbackQueue: DispatchQueue, completion: ((Result<DSAnyOrganization, DSStoreError>) -> Void)?)
    
    /// `deleteOrganization` асинхронно удаляет из хранилища `DSAnyOrganization`.
    /// - Parameters:
    ///   - organization: Организация для удаления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func deleteOrganization(_ organization: DSAnyOrganization, callbackQueue: DispatchQueue, completion: ((Result<DSAnyOrganization, DSStoreError>) -> Void)?)
    
}

// MARK: - Персональный метод для `DSAnyReadOnlyOrganizationsStore`

extension DSAnyReadOnlyOrganizationsStore {
    
    public func fetchOrganization(withID id: String, callbackQueue: DispatchQueue = .main, completion: @escaping (Result<DSAnyOrganization, DSStoreError>) -> Void) {
        var query = DSOrganizationQuery()
        query.ids = [id]
        
        fetchOrganizations(query: query, callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let organizations):
                if let first = organizations.first { completion(.success(first)); return }
                completion(.failure(.fetchFailed(reason: "No organization with matching ID")))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func fetchOrganizationType(withID id: String, callbackQueue: DispatchQueue = .main, completion: @escaping (Result<DSAnyOrganizationType, DSStoreError>) -> Void) {
        var query = DSOrganizationQuery()
        query.ids = [id]
        
        fetchOrganizationTypes(query: query, callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let types):
                if let first = types.first { completion(.success(first)); return }
                completion(.failure(.fetchFailed(reason: "No organization with matching ID")))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}

// MARK: - Персональные методы для `DSAnyOrganizationsStore`

extension DSAnyOrganizationsStore {
    
    public func addOrganization(_ organization: DSAnyOrganization, callbackQueue: DispatchQueue, completion: ((Result<DSAnyOrganization, DSStoreError>) -> Void)?) {
        addOrganizations([organization], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let organizations):
                if let first = organizations.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to add contact")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    public func updateOrganization(_ organization: DSAnyOrganization, callbackQueue: DispatchQueue, completion: ((Result<DSAnyOrganization, DSStoreError>) -> Void)?) {
        updateOrganizations([organization], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let organizations):
                if let first = organizations.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to update contact")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    public func deleteOrganization(_ organization: DSAnyOrganization, callbackQueue: DispatchQueue, completion: ((Result<DSAnyOrganization, DSStoreError>) -> Void)?) {
        deleteOrganizations([organization], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let organizations):
                if let first = organizations.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to delete contact")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
}
