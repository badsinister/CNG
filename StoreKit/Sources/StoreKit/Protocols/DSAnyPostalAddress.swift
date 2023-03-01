/**
 
 Данные о физическом адресе.
 
 */

import Foundation

public protocol DSAnyPostalAddress {
    
    /// Название города.
    var city: String? { get }

    /// Полный адрес внутри города.
    var street: String? { get }

}
