/**
 
 Почтовый адрес. Модель данных.
 
 */

import Foundation

public struct DSPostalAddress: Codable, Hashable, DSAnyPostalAddress {
    
    // MARK: - DSAnyPostalAddress
    public var city: String?
    public var street: String?
    
}
