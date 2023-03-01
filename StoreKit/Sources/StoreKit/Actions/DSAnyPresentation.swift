/**
 
 Презентация.
 
 */

import Foundation

/// Информация о презентации.
public protocol DSAnyPresentation: DSAnyObject {
    
    /// Уникальный идентификатор.
    var id: String { get }
    
    /// Название сценария.
    var name: String { get }
    
    /// Количество слайдов.
    var slidesCount: String { get }
    
    /// Изображение.
    var asset: String? { get }

    /// Дата обновления.
    var updatedDate: Date? { get }
}
