/**
 
 Данные об организации.
 
 */

import Foundation

/// Данные об организации.
public protocol DSAnyOrganization: DSAnyObject {
    
    /// Уникальный идентификатор организации в системе.
    var id: String { get }

    /// Название организации.
    var name: String { get }
    
    /// Почтовый адрес организации.
    var postalAddress: DSPostalAddress? { get }
    
    /// Номер контактного телефона.
    var phoneNumber: String? { get }

    /// Тип организации
    var type: DSOrganizationType { get }
    
    /// Признак добавления в избранное.
    var isFavorited: Bool { get }
}
