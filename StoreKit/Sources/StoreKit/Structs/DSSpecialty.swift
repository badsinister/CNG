/**
 
 Специальность. Модель данных.
 
 */

import Foundation

/// Специальность.
public struct DSSpecialty: Codable, Equatable, Identifiable {
    
    public var id: String
    public var name: String
    
    /// Основной конструктор объекта `DSSpecialty`.
    /// - Parameters:
    ///   - id: Уникальный идентификатор.
    ///   - name: Название специальности.
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }

}
