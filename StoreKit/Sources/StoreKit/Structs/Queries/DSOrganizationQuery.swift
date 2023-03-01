/**
 
 Запрос для извлечения организаций.
 
 */

import Foundation

/// Параметры для результатов запроса организаций из хранилища.
public struct DSOrganizationQuery: DSAnyQuery, Equatable {
    
    /// Виды параметров сортировки результатов.
    public enum SortDescriptor: Equatable {
        case name(ascending: Bool)
    }
    
    /// Параметры сортировки результатов.
    public var sortDescriptors: [SortDescriptor] = []
    
    /// Извлечение по идентификатору.
    public var ids: [String] = []
    
    public init() { }
    
    public init(id: String) {
        self.ids = [id]
    }
}
