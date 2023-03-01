
import Foundation

/// Протокол объекта хранящего индекс перечисления
public protocol CKIndexable: AnyObject {
    
    /// Текущий индекс
    var index: CKAnyIndex { get set }
    
}
