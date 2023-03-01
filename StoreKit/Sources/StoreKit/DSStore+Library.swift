/**
 
  Хранилище данных `DSAnyLibraryStore`.
 
 */

import Foundation

extension DSStore {
    
    public func addEntities(_ entities: [DSAnyLibraryEntity], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyLibraryEntity], DSStoreError>) -> Void)?) {
    }
    
    public func updateEntities(_ entities: [DSAnyLibraryEntity], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyLibraryEntity], DSStoreError>) -> Void)?) {
    }
    
    public func deleteEntities(_ entities: [DSAnyLibraryEntity], callbackQueue: DispatchQueue, completion: ((Result<[DSAnyLibraryEntity], DSStoreError>) -> Void)?) {
    }
    
    public func fetchEntities(query: DSAnyQuery = DSLibraryEntityQuery(), callbackQueue: DispatchQueue = .main, completion: @escaping (Result<[DSAnyLibraryEntity], DSStoreError>) -> Void) {
        let entities = [
            DSLibraryEntity(id: UUID().uuidString, name: "Файлик", сategory: .file),
            DSLibraryEntity(id: UUID().uuidString, name: "Фолдер с информацией", сategory: .file)
        ]
        completion(.success(entities))
    }
    
}
