/**
 
 Индекс страниц планировщика.
 
 */

import Foundation
import CoreKitUI

public struct CNGShedulerPageIndex: CKAnyIndex {
    
    /// Текущая дата
    var value: Date
    
    var title: String {
        return DateFormatter.localizedString(from: value, dateStyle: .medium, timeStyle: .none)
    }
    
    /// Увеличение индекса.
    public func next() -> CKAnyIndex? {
        return CNGShedulerPageIndex(date: Date(timeInterval: 24*60*60, since: value))
    }
    
    /// Уменьшение индекса.
    public func previous() -> CKAnyIndex? {
        return CNGShedulerPageIndex(date: Date(timeInterval: -24*60*60, since: value))
    }
    
    public init(date: Date = Date()) {
        self.value = date
    }
    
}
