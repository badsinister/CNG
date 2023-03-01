/**
 
 Индекс страниц детального контроллера Организации.
 
 */

import Foundation
import CoreKitUI

public enum CNGDetailedOrganizationPageIndex: Int, CaseIterable, CKAnyIndex {

    /// Основная информация об организации
    case main
    /// Карта находжение организации
    case map
    /// Контакты находящиеся в организации
    case contacts
    /// Архив событий прошедших в организации
    case events

    var title: String {
        switch self {
        case .main: return "Main"
        case .map: return "Map"
        case .contacts: return "Contacts"
        case .events: return "Events"
        }
    }
    
    /// Увеличение индекса.
    public func next() -> CKAnyIndex? {
        switch self {
        case .main: return CNGDetailedOrganizationPageIndex.map
        case .map: return CNGDetailedOrganizationPageIndex.contacts
        case .contacts: return CNGDetailedOrganizationPageIndex.events
        case .events: return CNGDetailedOrganizationPageIndex.main
        }
    }
    
    /// Уменьшение индекса.
    public func previous() -> CKAnyIndex? {
        switch self {
        case .main: return CNGDetailedOrganizationPageIndex.events
        case .map: return CNGDetailedOrganizationPageIndex.main
        case .contacts: return CNGDetailedOrganizationPageIndex.map
        case .events: return CNGDetailedOrganizationPageIndex.contacts
        }
    }
    
}
