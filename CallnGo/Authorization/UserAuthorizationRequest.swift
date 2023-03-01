
import UIKit
import CKAuthentificationKit

/// Параметры авторизации (на сервере) пользователя.
struct UserAuthorizationRequest: CKAnyAuthorizationRequest {
    
    /// Логин пользователя.
    var email: String
    /// Пароль пользователя.
    var password: String
    /// Уникальный идентификатор устройства.
    var device_id: String
    /// Модель устройства.
    var device_type: String
    /// Локализация.
    var locale: String
    /// TimeZone.
    var timezone: String
    /// iOS version.
    var os: String
    /// Информация о приложении.
    var app: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
        self.device_id = UIDevice.current.identifierForVendor?.uuidString ?? ""
        self.device_type = UIDevice.modelName
        self.os = "\(UIDevice.current.systemName)@\(UIDevice.current.systemVersion)"
        let bundleName = Bundle.main.infoDictionary?["CFBundleName"] as? String
        let shortVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let bundleVersion = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
        
        self.app = "\(bundleName ?? "")@\(shortVersion ?? "").\(bundleVersion ?? "")"
        self.locale = Locale.current.identifier
        self.timezone = TimeZone.current.identifier
    }
}
