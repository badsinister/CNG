/**
 
 Тип организация. Модель данных.
 
 */

import Foundation

public struct DSOrganizationType: Codable, Hashable, Identifiable, DSAnyOrganizationType {
    
    // MARK: - DSAnyOrganizationType
    public var id: String
    public var name: String
    public var category: DSOrganizationCategory?
    
}
