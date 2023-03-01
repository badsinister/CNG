/**
 
 Данные о типе организации.
 
 */

import Foundation

public enum DSOrganizationCategory: String, Codable, Hashable {
    case pharmacy
    case hospital
}

/// Данные о типе организации.
public protocol DSAnyOrganizationType {
    
    /// Уникальный идентификатор типа организации в системе.
    var id: String { get }
    
    /// Название типа организации.
    var name: String { get }
    
    /// Идентификатор типа организации.
    var category: DSOrganizationCategory? { get }
}
