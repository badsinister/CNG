/**
 
 Контактная информация.
 
 */

import Foundation

/// Персональная контактная информация.
public protocol DSAnyContact {
    
    /// Уникальный идентификатор контакта в системе.
    var id: String { get }
    
    /// Полное имя контакта.
    var fullName: PersonNameComponents { get }
    
    /// Электронный адрес.
    var emailAddress: String? { get }
    
    /// Номер контактного телефона.
    var phoneNumber: String? { get }
    
    /// День рождения.
    var birthday: Date? { get }
    
    /// Признак добавления в избранное.
    var isFavorited: Bool { get }
}
