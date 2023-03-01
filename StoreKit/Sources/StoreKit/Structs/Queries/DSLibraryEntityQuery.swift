/**
 
 Запрос для извлечения элементов каталога.
 
 */

import Foundation

/// Параметры для результатов запроса элементов каталога из хранилища.
public struct DSLibraryEntityQuery: DSAnyQuery, Equatable {
    
    /// Виды параметров сортировки результатов.
    public enum SortDescriptor: Equatable {
        case name(ascending: Bool)
    }
    
    /// Параметры сортировки результатов.
    public var sortDescriptors: [SortDescriptor] = []
    
    /// Извлечение по идентификатору.
    public var ids: [String] = []
    
    /// Извлечение по идентификатору родителя.
    public var parentIds: [String] = []

    public init() { }
    
    public init(id: String) {
        self.ids = [id]
    }
}
