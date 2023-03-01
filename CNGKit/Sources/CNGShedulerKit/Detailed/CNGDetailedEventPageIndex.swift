/**
 
 Индекс страниц детального контроллера Событие.
 
 */

import Foundation
import CoreKitUI

public enum CNGDetailedEventPageIndex: Int, CaseIterable, CKAnyIndex {
    
    /// Основная информация о событии
    case main
    /// Результаты
    case results
    
    var title: String {
        switch self {
        case .main: return "Main"
        case .results: return "Results"
        }
    }
    
    /// Увеличение индекса.
    public func next() -> CKAnyIndex? {
        switch self {
        case .main: return CNGDetailedEventPageIndex.results
        case .results: return CNGDetailedEventPageIndex.main
        }
    }
    
    /// Уменьшение индекса.
    public func previous() -> CKAnyIndex? {
        switch self {
        case .main: return CNGDetailedEventPageIndex.results
        case .results: return CNGDetailedEventPageIndex.main
        }
    }
    
}
