/**
 
 Индекс страниц детального контроллера Контакта.
 
 */

import Foundation
import CoreKitUI

public enum CNGDetailedContactPageIndex: Int, CaseIterable, CKAnyIndex {
    
    /// Основная информация о контакте
    case main
    /// Архив событий
    case events
    
    var title: String {
        switch self {
        case .main: return "Main"
        case .events: return "Events"
        }
    }
    
    /// Увеличение индекса.
    public func next() -> CKAnyIndex? {
        switch self {
        case .main: return CNGDetailedContactPageIndex.events
        case .events: return CNGDetailedContactPageIndex.main
        }
    }
    
    /// Уменьшение индекса.
    public func previous() -> CKAnyIndex? {
        switch self {
        case .main: return CNGDetailedContactPageIndex.events
        case .events: return CNGDetailedContactPageIndex.main
        }
    }
    
}
