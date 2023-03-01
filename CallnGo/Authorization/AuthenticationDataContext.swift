/**
 
 Контекст данных для авторизации
 
 */

import UIKit
import CKAuthentificationKit

class AuthenticationDataContext {
    
    lazy var authentificationController = CKAuthentificationController {
        $0.url = URL(string: "https://demo.call-n-go.com/api/v3/tokens") // b@vivanti.ru ViVanti13
    }
    
    /// Авторизация пользователя в системе.
    /// - completion: Результат авторизации и сообщение для пользователя
    func login(login: String?, password: String?, _ completion: @escaping (Bool, String?) -> Void) {
        guard let login = login, !login.isEmpty else {
            completion(false, "Login empty")
            return
        }
        guard let password = password, !password.isEmpty else {
            completion(false, "Password empty")
            return
        }
        let request = UserAuthorizationRequest(email: login, password: password)
        let provider = UserAuthorizationProvider(withRequest: request)
        authentificationController.authorize(with: provider) { result in
            switch result {
            case .success(let account):
                print("=> ON: \(account)")
                completion(true, nil)
            case .failure(let error):
                print("=> OFF: \(error)")
                completion(false, error.localizedDescription)
            }
        }
    }
    
}
