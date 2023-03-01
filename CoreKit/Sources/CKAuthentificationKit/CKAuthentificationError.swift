/**
 
 Ошибки авторизации.
 
 */

import Foundation

/// `CKAuthentificationError` ошибки возникающие при авторизации.
public enum CKAuthentificationError: LocalizedError {
    
    /// Отказ в авторизации на сервере.
    case rejection(reason: String)

    /// Ошибка сериализации данных.
    case serializationFailed(reason: String)
    
    /// Истечения срока времени исполнения.
    /// - Note: Ошибка работы с интернет соединением.
    case timedOut(reason: String)

    public var errorDescription: String? {
        switch self {
        case .rejection(let reason): return "Server rejection: \(reason)"
        case .serializationFailed(let reason): return "JSON serialization failed: \(reason)"
        case .timedOut(let reason): return "Timed out: \(reason)"
        }
    }

}
