/**
 
 Контакт. Модель данных.
 
 */

import Foundation

public struct DSContact: Codable, Hashable, Identifiable, DSAnyContact {
    
    // MARK: - DSAnyContact
    public var id: String
    public var fullName: PersonNameComponents
    public var emailAddress: String?
    public var phoneNumber: String?
    public var birthday: Date?
    public var isFavorited: Bool
    
}
