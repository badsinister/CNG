
import UIKit

/// Подготовка и обновление вида.
public protocol CKAnyViewSynchronizer {
    
    associatedtype View: UIView & CKStylable
    
    associatedtype Model: CKAnyDataContext
    
    /// Подготавливает вид для отображения.
    func makeView() -> View
    
    /// Обновляет вид используя переданный контекст данных.
    /// - Parameters:
    ///   - view: Вид который должен быть обновлен.
    ///   - context: Контекст данных для обновления вида.
    func updateView(_ view: View, context: Model)
    
}
