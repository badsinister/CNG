/**
 
 Контакт в организации.
 
 */

import Foundation

/// Должность в организации.
public protocol DSAnyContactPosition {

    /// Уникальный идентификатор должности в системе.
    var id: String { get }
    
    /// Название должности контакта.
    var name: String? { get }
    
    /// Контакт.
    var contact: DSContact { get }
    
    /// Организация.
    var organization: DSOrganization { get }
}
