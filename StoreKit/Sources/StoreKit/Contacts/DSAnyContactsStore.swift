/**
 
 Хранилище данных типа контакты.
 
 */

import Foundation

/// Хранилище данных соответствующих протоколу типа `DSAnyContact`.
public protocol DSAnyReadOnlyContactsStore: DSAnyStore {
    
    /// `fetchContacts` извлекает из хранилища данные массив данных `DSAnyContact`.
    /// - Parameters:
    ///   - query: Параметры запроса. Определяются протоколом `DSAnyQuery`.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchContacts(query: DSAnyQuery, callbackQueue: DispatchQueue, completion: @escaping (Result<[DSAnyContact], DSStoreError>) -> Void)
    
    // MARK: - Singular methods
    
    /// `fetchContact` извлекает из хранилища контакт `DSAnyContact` для заданного идентификатора.
    /// - Parameters:
    ///   - id: Уникальный идентификатор контакта.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchContact(withID id: String, callbackQueue: DispatchQueue, completion: @escaping (Result<DSAnyContact, DSStoreError>) -> Void)
    
    // MARK: - Contact Position
    
    /// `fetchContactPositions` извлекает из хранилища массив данных `DSAnyContactPosition`.
    /// - Parameters:
    ///   - query: Параметры запроса. Определяются протоколом `DSAnyQuery`.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchContactPositions(query: DSAnyQuery, callbackQueue: DispatchQueue, completion: @escaping (Result<[DSAnyContactPosition], DSStoreError>) -> Void)
    
    // MARK: - Singular methods
    
    /// `fetchContactPosition` извлекает из хранилища должность `DSAnyContactPosition` для заданного идентификатора.
    /// - Parameters:
    ///   - id: Уникальный идентификатор должности.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchContactPosition(withID id: String, callbackQueue: DispatchQueue, completion: @escaping (Result<DSAnyContactPosition, DSStoreError>) -> Void)
    
    // MARK: - Specialties
    
    /// `fetchSpecialties` извлекает из хранилища массив данных `DSSpecialty`.
    /// - Parameters:
    ///   - query: Параметры запроса. Определяются протоколом `DSAnyQuery`.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func fetchSpecialties(callbackQueue: DispatchQueue, completion: @escaping (Result<[DSSpecialty], DSStoreError>) -> Void)
    
}

/// Хранилище данных соответствующих протоколу типа `DSAnyContact`.
public protocol DSAnyContactsStore: DSAnyReadOnlyContactsStore {
    
    /// `addContacts` асинхронно добавляет в хранилище список контактов `DSAnyContact`.
    /// - Parameters:
    ///   - contacts: Массив контактов для добавления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func addContacts(_ contacts: [DSAnyContact], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyContact], DSStoreError>) -> Void)?)
    
    /// `updateContacts` асинхронно обновляет в хранилища список контактов `DSAnyContact`.
    /// - Parameters:
    ///   - contacts: Массив контактов для изменения.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func updateContacts(_ contacts: [DSAnyContact], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyContact], DSStoreError>) -> Void)?)
    
    /// `deleteContacts` асинхронно удаляет из хранилища список контактов `DSAnyContact`.
    /// - Parameters:
    ///   - contacts: Массив контактов для удаления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func deleteContacts(_ contacts: [DSAnyContact], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyContact], DSStoreError>) -> Void)?)
    
    // MARK: - Singular methods
    
    /// `addContact` асинхронно добавляет в хранилище контакт `DSAnyContact`.
    /// - Parameters:
    ///   - contact: Контакт для добавления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func addContact(_ contact: DSAnyContact, callbackQueue: DispatchQueue, completion: ((Result<DSAnyContact, DSStoreError>) -> Void)?)
    
    /// `updateContact` асинхронно обновляет в хранилища контакт `DSAnyContact`.
    /// - Parameters:
    ///   - contact: Контакт для изменения.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func updateContact(_ contact: DSAnyContact, callbackQueue: DispatchQueue, completion: ((Result<DSAnyContact, DSStoreError>) -> Void)?)
    
    /// `deleteContact` асинхронно удаляет из хранилища контакт `DSAnyContact`.
    /// - Parameters:
    ///   - contact: Контакт для удаления.
    ///   - callbackQueue: Очередь в которой происходит вызов кода возврата. Поумолчанию главный поток `main`.
    ///   - completion: Код возврата данных. Вызывается в очереди `callbackQueue`.
    func deleteContact(_ contact: DSAnyContact, callbackQueue: DispatchQueue, completion: ((Result<DSAnyContact, DSStoreError>) -> Void)?)
    
}

// MARK: - Персональный метод для `DSAnyReadOnlyContactsStore`

extension DSAnyReadOnlyContactsStore {
    
    public func fetchContact(withID id: String, callbackQueue: DispatchQueue = .main, completion: @escaping (Result<DSAnyContact, DSStoreError>) -> Void) {
        var query = DSContactQuery()
        query.ids = [id]
        
        fetchContacts(query: query, callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let contacts):
                if let first = contacts.first { completion(.success(first)); return }
                completion(.failure(.fetchFailed(reason: "No contact with matching ID")))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func fetchContactPosition(withID id: String, callbackQueue: DispatchQueue = .main, completion: @escaping (Result<DSAnyContactPosition, DSStoreError>) -> Void) {
        var query = DSContactQuery()
        query.ids = [id]
        
        fetchContactPositions(query: query, callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let positions):
                if let first = positions.first { completion(.success(first)); return }
                completion(.failure(.fetchFailed(reason: "No contact with matching ID")))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}

// MARK: - Персональные методы для `DSAnyContactsStore`

extension DSAnyContactsStore {
    
    public func addContact(_ contact: DSAnyContact, callbackQueue: DispatchQueue, completion: ((Result<DSAnyContact, DSStoreError>) -> Void)?) {
        addContacts([contact], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let contacts):
                if let first = contacts.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to add contact")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    public func updateContact(_ contact: DSAnyContact, callbackQueue: DispatchQueue, completion: ((Result<DSAnyContact, DSStoreError>) -> Void)?) {
        updateContacts([contact], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let contacts):
                if let first = contacts.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to update contact")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
    
    public func deleteContact(_ contact: DSAnyContact, callbackQueue: DispatchQueue, completion: ((Result<DSAnyContact, DSStoreError>) -> Void)?) {
        deleteContacts([contact], callbackQueue: callbackQueue) { result in
            switch result {
            case .success(let contacts):
                if let first = contacts.first { completion?(.success(first)); return }
                completion?(.failure(.fetchFailed(reason: "Failed to delete contact")))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }

}
