
import Foundation
import StoreKit

/// Сохраняет данные организации для предоставления контроллерам.
enum CNGDetailedOrganization {
    /// Организация
    case organization(DSAnyOrganization)
    /// Уникальный идентификатор организации
    case organizationID(String)
}
