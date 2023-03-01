/**
 
 Тип события. Модель данных.
 
 */

import Foundation

/// Тип события.
public struct DSEventType: Codable, Equatable, Identifiable {
    
    public var id: Int
    public var name: String

    public var abbr: String

    public var group: String

    /// Основной конструктор объекта `DSEventType`.
    /// - Parameters:
    ///   - id: Уникальный идентификатор.
    ///   - name: Название типа события.
    ///   - abbr: Код типа обытия.
    ///   - group: Название группы типов событий.
    public init(id: Int, name: String, abbr: String, group: String = "") {
        self.id = id
        self.name = name
        self.abbr = abbr
        self.group = group
    }
    
}
