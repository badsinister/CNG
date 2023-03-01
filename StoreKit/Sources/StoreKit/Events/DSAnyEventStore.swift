/**
 
 Хранилище данных типа события.
 
 */

import Foundation

/// Хранилище данных соответствующих протоколу типа `DSAnyEvent`.
public protocol DSAnyReadOnlyEventsStore: DSAnyStore {
    
    /// `fetchEvents` извлекает из хранилища данные массив данных `DSAnyEvent`.
    /// - Parameters:
    ///   - query: Параметры запроса. Определяются протоколом `DSAnyQuery`.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchEvents(query: DSAnyQuery, callbackQueue: DispatchQueue, completion: @escaping (Result<[DSAnyEvent], DSStoreError>) -> Void)
    
    // MARK: - Singular methods
    
    /// `fetchEvent` извлекает из хранилища событие `DSAnyEvent` для заданного идентификатора.
    /// - Parameters:
    ///   - id: Уникальный идентификатор события.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchEvent(withID id: String, callbackQueue: DispatchQueue, completion: @escaping (Result<DSAnyEvent, DSStoreError>) -> Void)
    
}

/// Хранилище данных соответствующих протоколу типа `DSAnyEvent`.
public protocol DSAnyEventsStore: DSAnyReadOnlyEventsStore {
    
    /// `addContacts` асинхронно добавляет в хранилище список событий `DSAnyEvent`.
    /// - Parameters:
    ///   - events: Массив событий для добавления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func addEvents(_ events: [DSAnyEvent], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyEvent], DSStoreError>) -> Void)?)
    
    /// `updateContacts` асинхронно обновляет в хранилища список событий `DSAnyEvent`.
    /// - Parameters:
    ///   - events: Массив событий для изменения.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func updateEvents(_ events: [DSAnyEvent], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyEvent], DSStoreError>) -> Void)?)
    
    /// `deleteContacts` асинхронно удаляет из хранилища список событий `DSAnyEvent`.
    /// - Parameters:
    ///   - events: Массив событий для удаления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func deleteEvents(_ events: [DSAnyEvent], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyEvent], DSStoreError>) -> Void)?)
    
    // MARK: - Singular methods
    
    /// `addContact` асинхронно добавляет в хранилище событие `DSAnyEvent`.
    /// - Parameters:
    ///   - event: Контакт для добавления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func addEvent(_ event: DSAnyEvent, callbackQueue: DispatchQueue, completion: ((Result<DSAnyEvent, DSStoreError>) -> Void)?)
    
    /// `updateContact` асинхронно обновляет в хранилища событие `DSAnyEvent`.
    /// - Parameters:
    ///   - event: Контакт для изменения.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func updateEvent(_ event: DSAnyEvent, callbackQueue: DispatchQueue, completion: ((Result<DSAnyEvent, DSStoreError>) -> Void)?)
    
    /// `deleteContact` асинхронно удаляет из хранилища событие `DSAnyEvent`.
    /// - Parameters:
    ///   - event: Контакт для удаления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func deleteEvent(_ event: DSAnyEvent, callbackQueue: DispatchQueue, completion: ((Result<DSAnyEvent, DSStoreError>) -> Void)?)
    
}

// MARK: - Персональный метод для `DSAnyReadOnlyContactsStore`

extension DSAnyReadOnlyEventsStore {
    
    public func fetchEvent(withID id: String, callbackQueue: DispatchQueue = .main, completion: @escaping (Result<DSAnyEvent, DSStoreError>) -> Void) {
        var query = DSEventQuery()
        query.ids = [id]
        
        fetchEvents(query: query, callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let events):
                if let first = events.first { completion(.success(first)); return }
                completion(.failure(.fetchFailed(reason: "No contact with matching ID")))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}

// MARK: - Персональные методы для `DSAnyEventsStore`

extension DSAnyEventsStore {
    
    public func addEvent(_ event: DSAnyEvent, callbackQueue: DispatchQueue = .main, completion: ((Result<DSAnyEvent, DSStoreError>) -> Void)?) {
        addEvents([event], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let events):
                if let first = events.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to add event")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    public func updateEvent(_ event: DSAnyEvent, callbackQueue: DispatchQueue = .main, completion: ((Result<DSAnyEvent, DSStoreError>) -> Void)?) {
        updateEvents([event], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let events):
                if let first = events.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to update event")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    public func deleteEvent(_ event: DSAnyEvent, callbackQueue: DispatchQueue = .main, completion: ((Result<DSAnyEvent, DSStoreError>) -> Void)?) {
        deleteEvents([event], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let events):
                if let first = events.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to delete event")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
}
