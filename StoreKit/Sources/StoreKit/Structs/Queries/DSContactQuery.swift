/**
 
 Запрос для извлечения контактов.
 
 */

import Foundation

/// Параметры для результатов запроса контактов из хранилища.
public struct DSContactQuery: DSAnyQuery, Equatable {
    
    /// Виды параметров сортировки результатов по имени.
    public enum SortDescriptor: Equatable {
        case givenName(ascending: Bool)
        case familyName(ascending: Bool)
        case effectiveDate(ascending: Bool)
    }
    
    /// Параметры сортировки результатов по имени.
    public var sortDescriptors: [SortDescriptor] = []
    
    /// Извлечение по идентификатору.
    public var ids: [String] = []
    
    public init() { }
    
    public init(id: String) {
        self.ids = [id]
    }
}
