/**
 
 Данные для регистрации нового пользователя.
 
 */

import Foundation

/// Соответствие `CKAnyRegistrationRequest` определяет параметры (поля) для запроса регстрации на сервере.
public protocol CKAnyRegistrationRequest: CKAnyRequest, Codable { }
