/**
 
 Элемент каталога.
 
 */

import Foundation

/// Объект системы каталога: директория или файл.
public protocol DSAnyLibraryEntity {
    
    /// Уникальный идентификатор объекта в каталоге.
    var id: String { get }
    
    /// Название объекта.
    var name: String { get }

    /// Тип объекта
    var сategory: DSLibraryEntityCategory { get }
}
