/**
 
 Хранилище данных каталога.
 
 */

import Foundation

/// Хранилище данных соответствующих протоколу типа `DSAnyLibraryEntity`.
public protocol DSAnyReadOnlyLibraryStore: DSAnyStore {
    
    /// `fetchEntities` извлекает из хранилища данные массив данных `DSAnyLibraryEntity`.
    /// - Parameters:
    ///   - query: Параметры запроса. Определяются протоколом `DSAnyQuery`.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchEntities(query: DSAnyQuery, callbackQueue: DispatchQueue, completion: @escaping (Result<[DSAnyLibraryEntity], DSStoreError>) -> Void)
    
    // MARK: - Singular methods
    
    /// `fetchEntity` извлекает из хранилища `DSAnyLibraryEntity` для заданного идентификатора.
    /// - Parameters:
    ///   - id: Уникальный идентификатор контакта.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchEntity(withID id: String, callbackQueue: DispatchQueue, completion: @escaping (Result<DSAnyLibraryEntity, DSStoreError>) -> Void)
    
}

/// Хранилище данных соответствующих протоколу типа `DSAnyLibraryEntity`.
public protocol DSAnyLibraryStore: DSAnyReadOnlyLibraryStore {
    
    /// `addEntities` асинхронно добавляет в хранилище список элементов каталога `DSAnyLibraryEntity`.
    /// - Parameters:
    ///   - entities: Массив объектов для добавления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func addEntities(_ entities: [DSAnyLibraryEntity], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyLibraryEntity], DSStoreError>) -> Void)?)
    
    /// `updateEntities` асинхронно обновляет в хранилища список элементов каталога `DSAnyLibraryEntity`.
    /// - Parameters:
    ///   - entities: Массив объектов для изменения.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func updateEntities(_ entities: [DSAnyLibraryEntity], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyLibraryEntity], DSStoreError>) -> Void)?)
    
    /// `deleteEntities` асинхронно удаляет из хранилища список элементов каталога `DSAnyLibraryEntity`.
    /// - Parameters:
    ///   - entities: Массив объектов для удаления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func deleteEntities(_ entities: [DSAnyLibraryEntity], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyLibraryEntity], DSStoreError>) -> Void)?)
    
    // MARK: - Singular methods
    
    /// `addContact` асинхронно добавляет в хранилище элемент каталога `DSAnyLibraryEntity`.
    /// - Parameters:
    ///   - entity: Объект для добавления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func addEntity(_ entity: DSAnyLibraryEntity, callbackQueue: DispatchQueue, completion: ((Result<DSAnyLibraryEntity, DSStoreError>) -> Void)?)
    
    /// `updateContact` асинхронно обновляет в хранилища элемент каталога `DSAnyLibraryEntity`.
    /// - Parameters:
    ///   - entity: Объект для изменения.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func updateEntity(_ entity: DSAnyLibraryEntity, callbackQueue: DispatchQueue, completion: ((Result<DSAnyLibraryEntity, DSStoreError>) -> Void)?)
    
    /// `deleteContact` асинхронно удаляет из хранилища элемент каталога `DSAnyLibraryEntity`.
    /// - Parameters:
    ///   - entity: Объект для удаления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func deleteEntity(_ entity: DSAnyLibraryEntity, callbackQueue: DispatchQueue, completion: ((Result<DSAnyLibraryEntity, DSStoreError>) -> Void)?)
    
}

// MARK: - Персональный метод для `DSAnyReadOnlyLibraryStore`

extension DSAnyReadOnlyLibraryStore {
    
    public func fetchEntity(withID id: String, callbackQueue: DispatchQueue = .main, completion: @escaping (Result<DSAnyLibraryEntity, DSStoreError>) -> Void) {
        var query = DSLibraryEntityQuery()
        query.ids = [id]
        
        fetchEntities(query: query, callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let entities):
                if let first = entities.first { completion(.success(first)); return }
                completion(.failure(.fetchFailed(reason: "No library entity with matching ID")))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

// MARK: - Персональные методы для `DSAnyLibraryStore`

extension DSAnyLibraryStore {
    
    public func addEntity(_ entity: DSAnyLibraryEntity, callbackQueue: DispatchQueue, completion: ((Result<DSAnyLibraryEntity, DSStoreError>) -> Void)?) {
        addEntities([entity], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let entities):
                if let first = entities.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to add library entity")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    public func updateEntity(_ entity: DSAnyLibraryEntity, callbackQueue: DispatchQueue, completion: ((Result<DSAnyLibraryEntity, DSStoreError>) -> Void)?) {
        updateEntities([entity], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let entities):
                if let first = entities.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to update library entity")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    public func deleteEntity(_ entity: DSAnyLibraryEntity, callbackQueue: DispatchQueue, completion: ((Result<DSAnyLibraryEntity, DSStoreError>) -> Void)?) {
        deleteEntities([entity], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let entities):
                if let first = entities.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to delete library entity")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
}
