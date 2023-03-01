/**
 
 Контроллер для работы с данными.
 
 */

import Foundation

/// Контроллер для работы с данными.
public protocol CKAnyDataProvider: ObservableObject {
    
    /// Извлечение данных из хранилища.
    /// - Parameter completion: Код вызываемый при завершении извлечения данных.
    func fetchData(_ completion: (() -> Void)?)
    
}

public extension CKAnyDataProvider {
    func fetchData(_ completion: (() -> Void)?) { }
}
