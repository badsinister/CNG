/**
 
 Аккаунт пользователя.
 
 Хранение данных авторизации пользователя.
 
 */

import Foundation

public class CKAccount {

    /// Идентификатор аккаунта.
    public var identifier: String!

    /// Имя пользователя в системе для данного аккаунта.
    public var username: String!

    /// Конфиденциальные данные для доступа к аккаунту.
    public var credential: CKAccountCredential?
    
    /// Конструктор поумолчанию.
    public init() { }
    
    //MARK: - Methods
    
    public func addToken(_ token: String) {
        credential = CKAccountCredential(withToken: token)
    }
    
}
