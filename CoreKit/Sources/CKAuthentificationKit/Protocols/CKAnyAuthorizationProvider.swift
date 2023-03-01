/**
 
 Провайдер авторизации.
 
 */

import Foundation

public protocol CKAnyAuthorizationProvider: AnyObject {
    
    /// Запрос текущего статуса авторизации.
    static func getCredentialState(forUserID userID: String, completion: @escaping (CredentialState) -> Void)
    
    /// Создание авторизационного запроса.
    func createRequest() -> CKAnyAuthorizationRequest
    
    /// Декодирование ответа сервера.
    func decode(_ data: Data) throws -> CKAccountCredential
    
}

/// Текущий статус авторизации пользователя
public enum CredentialState {
    /// Пользователь не авторизован в системе, или авторизация анулирована.
    case revoked
    /// Пользователь авторизован в системе.
    case authorized
    /// Пользователь не найден.
    case notFound
}

extension CKAnyAuthorizationProvider {
    
    public static func getCredentialState(forUserID userID: String, completion: @escaping (CredentialState) -> Void) {
        let store = CKAccountStore()
        if let account = store.account(withIdentifier: userID) {
            if account.credential?.token != nil {
                completion(.authorized)
            } else {
                completion(.revoked)
            }
        } else {
            completion(.notFound)
        }
    }
    
}
