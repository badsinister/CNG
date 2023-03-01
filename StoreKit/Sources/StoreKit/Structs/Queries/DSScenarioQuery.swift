/**
 
 Запрос для извлечения сценариев.
 
 */

import Foundation

/// Параметры для результатов запроса презентаций из хранилища.
public struct DSScenarioQuery: DSAnyQuery, Equatable {
    
    /// Виды параметров сортировки результатов по имени.
    public enum SortDescriptor: Equatable {
        case name(ascending: Bool)
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
