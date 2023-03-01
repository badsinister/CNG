/**
 
 Сценарий. Модель данных.
 
 */

import Foundation

public struct DSScenario: Codable, Hashable, Identifiable, DSAnyScenario {
    
    // MARK: - DSAnyScenario
    public var id: String
    public var name: String
    public var group: String
    public var updatedDate: Date?

}
