/**
 
 Ошибки генерируемые хранилищем данных.
 
 */

import Foundation

/// `DSError` описывает ошибки возникающие при работе с хранилищем `DSStore`
public enum DSStoreError: LocalizedError {
    /// Ошибка при извлечении данных.
    case fetchFailed(reason: String)
    
    /// Ошибка при добавлении данных.
    case addFailed(reason: String)
    
    /// Ошибка при изменении данных.
    case updateFailed(reason: String)
    
    /// Ошибка при удалении данных.
    case deleteFailed(reason: String)
    
    /// Ошибка при придоставлении неверного значения.
    case invalidValue(reason: String)
    
    /// Ошибка синхронизации с удаленных хранилищем.
    case remoteSynchronizationFailed(reason: String)
    
    /// Ошибка времени ожидания.
    /// - Note: Ошибка возможна при синхронизации с удаленным источником данных.
    case timedOut(reason: String)
    
    public var errorDescription: String? {
        switch self {
        case .fetchFailed(let reason): return "Failed to fetch: \(reason)"
        case .addFailed(reason: let reason): return "Failed to add: \(reason)"
        case .updateFailed(reason: let reason): return "Failed to update: \(reason)"
        case .deleteFailed(reason: let reason): return "Failed to delete: \(reason)"
        case .invalidValue(reason: let reason): return "Invalid value: \(reason)"
        case .remoteSynchronizationFailed(reason: let reason): return "Sync failed: \(reason)"
        case .timedOut(reason: let reason): return "Timed out: \(reason)"
        }
    }
}
