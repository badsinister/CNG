/**
 
 Авторизация администратора.
 
 Ответы Сервера.
 
 Успешная авторизация
 
 {
    token = ynY1D4AcaZzAigmsj1S9;
 }
 
 Ошибки авторизации
 
 {
    message = "Invalid email or password.";
    type = error;
 }

 */

import Foundation
import CKAuthentificationKit

public class UserAuthorizationProvider: CKAnyAuthorizationProvider {

    var request: CKAnyAuthorizationRequest
    
    public init(withRequest request: CKAnyAuthorizationRequest) {
        self.request = request
    }
    
    public func createRequest() -> CKAnyAuthorizationRequest {
        return request
    }

    public func decode(_ data: Data) throws -> CKAccountCredential {
        var response: Response
        do {
            response = try JSONDecoder().decode(Response.self, from: data)
        } catch {
            throw CKAuthentificationError.serializationFailed(reason: "Не удалось декодировать ответ сервера авторизации.")
        }
        print("Response: \(response)")

        guard let token = response.token else {
            if let type = response.type, type == "error", let message = response.message {
                throw CKAuthentificationError.rejection(reason: "\(message)")
            } else {
                throw CKAuthentificationError.rejection(reason: "Отказ в авторизации.")
            }
        }
        
        return CKAccountCredential(withToken: token)
    }

    // Данные для декодирование ответа сервера
    struct Response: Codable {
        var token: String?
        var message: String?
        var type: String?
    }

}
