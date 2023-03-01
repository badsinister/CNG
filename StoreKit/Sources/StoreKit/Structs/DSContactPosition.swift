/**
 
 Контакт в организации. Модель данных.
 
 */

import Foundation

public struct DSContactPosition: Codable, Hashable, Identifiable, DSAnyContactPosition {
    
    // MARK: - DSAnyContactPosition
    public var id: String
    public var name: String?
    public var contact: DSContact
    public var organization: DSOrganization

}
