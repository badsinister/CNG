/**
 
 Хранилище данных `Call and Go`
 
 */

import Foundation

public typealias DSAnyDataStore = DSAnyContactsStore & DSAnyOrganizationsStore & DSAnyActionsStore & DSAnyEventsStore & DSAnyLibraryStore

///
public enum DSStoreType: Equatable {
    ///
    case inMemory
    
    ///
    case onDisk
}

open class DSStore: DSAnyDataStore, Equatable {

    /// Название хранилища данных. Используется для именования файлов на диске.
    public let name: String
    
    /// Тип хранилища
    internal let storeType: DSStoreType
    
    // MARK: - Initializers
    
    public init(name: String, storeType: DSStoreType = .onDisk) {
        self.name = name
        self.storeType = storeType
    }
    
    public static func == (lhs: DSStore, rhs: DSStore) -> Bool {
        return lhs.name == rhs.name && lhs.storeType == rhs.storeType
    }
}
