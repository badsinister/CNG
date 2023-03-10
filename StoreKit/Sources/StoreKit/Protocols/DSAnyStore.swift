/**
 
 Основной протокол хранилища данных.
 
 */

import Foundation

/// Базовый протокол для хранилища дынных.
public protocol DSAnyStore {
 
    /// Название хранилища данных. Используется для именования файлов на диске.
    var name: String { get }

}
