/**
 
 Сценарий.
 
 */

import Foundation

/// Информация о сценарии.
public protocol DSAnyScenario: DSAnyObject {
    
    /// Уникальный идентификатор.
    var id: String { get }
    
    /// Название сценария.
    var name: String { get }
    
    /// Идентификатор группы.
    var group: String { get }
    
    /// Дата обновления.
    var updatedDate: Date? { get }
}
