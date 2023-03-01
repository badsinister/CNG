
import Foundation

/// Протокол определяющий индекс перечисления.
public protocol CKAnyIndex {
    
    /// Увеличение индекса.
    ///
    /// - Returns: Следующее значение индекса. Nil если индекс не существует.
    func next() -> CKAnyIndex?
    
    /// Уменьшение индекса.
    ///
    /// - Returns: Предыдущее значение индекса. Nil если индекс не существует.
    func previous() -> CKAnyIndex?
    
}
