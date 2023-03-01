/**
 
 Приватные данные для доступа к аккаунту.
 
 */

import Foundation

/// `CKAccountCredential` хранит данные необходимые для идентификации пользователя.
public struct CKAccountCredential {

    /// Токен используемый для доступа к аккаунту.
    var token: String

    public init(withToken token: String) {
        self.token = token
    }
    
}
