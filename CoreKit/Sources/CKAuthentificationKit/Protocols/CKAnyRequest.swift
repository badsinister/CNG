
import Foundation

/// `CKAnyRequest` определяет параметры для запросов к серверу.
public protocol CKAnyRequest: Codable { }

extension CKAnyRequest {
    
    /// Сериализация параметров регистрации в объект данных.
    /// - Returns: Объект Data с данными для регистрации пользователя.
    func jsonData() -> Data? {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        return try? encoder.encode(self)
    }
    
    /// Сериализация параметров регистрации в строку.
    /// - Returns: Строка String с данными для регистрации пользователя в формате UTF8.
    func jsonString() -> String? {
        guard let data = jsonData() else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
}
