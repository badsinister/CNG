/**
 
 Данные для авторизации пользователя.
 
 */

import Foundation

/// Соответствие `CKAnyAuthorizationRequest` определяет параметры (поля) для запроса авторизации к серверу.
public protocol CKAnyAuthorizationRequest: CKAnyRequest, Codable { }
