/**
 
 Контекст передачи данных для отображения.
 
 */

import Foundation

/// Контекст передачи данных для отображения `CKAnyViewSynchronizer`
public protocol CKAnyDataContext {
    
    associatedtype ViewModel
    
    /// Текущие данные для отображения.
    var model: ViewModel { get }
    
}
