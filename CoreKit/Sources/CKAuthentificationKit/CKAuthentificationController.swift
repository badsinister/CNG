/**
 
 Контроллер авторизации.
 
 */

import Foundation

/// Контроллер авторизации.
public class CKAuthentificationController {

    /// Конфигурация для контроллера авторизации.
    public struct Configuration {
        /// Адрес сервера для запроса авторизации.
        public var url: URL?
    }

    /// Конфигурация контроллера авторизации.
    private let configuration: Configuration

    /// Создание контроллера авторизации с заданной конфигурацией.
    /// - Parameters:
    ///   - configurationHandler: Конфигурация контроллера авторизации. Конфигурация содержится в Configuration
    public init(configurationHandler: (inout Configuration) -> Void = { _ in }) {
        var configuration = Configuration()
        configurationHandler(&configuration)
        self.configuration = configuration
    }

    /// Авторизация пользователя в системе
    public func authorize(with authorizationProvider: CKAnyAuthorizationProvider, callbackQueue: DispatchQueue = .main, _ completion: @escaping (Result<CKAccount, CKAuthentificationError>) -> Void) {
                
        let authorizationRequest = authorizationProvider.createRequest()
        var request = URLRequest(url: configuration.url!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        request.httpMethod = "POST"
        //request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = authorizationRequest.jsonData()
        
        print("===========================")
        print(request.url ?? "No url")
        print(request.allHTTPHeaderFields ?? "No headers")
        print(authorizationRequest.jsonString() ?? "No params")
        print("===========================")

        let authorizationTask = URLSession(configuration: URLSessionConfiguration.ephemeral).dataTask(with: request) { data, response, error in
            print(response ?? "No response")
            
            if let error = error {
                print("dataTask error: \(error)")
                callbackQueue.async {
                    completion(.failure(.timedOut(reason: error.localizedDescription)))
                }
                return
            }

            guard let data = data else {
                callbackQueue.async {
                    completion(.failure(.serializationFailed(reason: "Нет данных от сервера.")))
                }
                return
            }
 
            //guard let response = response as? HTTPURLResponse, (200 ... 299).contains(response.statusCode) else {
            //    callbackQueue.async {
            //        completion(.failure(.timedOut(reason: "")))
            //    }
            //    return
            //}

            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(json)
                
                let credential = try authorizationProvider.decode(data)
                let account = CKAccount()
                account.credential = credential
                callbackQueue.async {
                    completion(.success(account))
                }
            } catch {
                callbackQueue.async {
                    completion(.failure(error as! CKAuthentificationError))
                }
            }
        }
        
        authorizationTask.resume()
    }

    /// Регистрация пользователя в системе
    public func register(with registrationRequest: CKAnyRegistrationRequest, callbackQueue: DispatchQueue = .main, _ completion: @escaping (Result<CKAccount, CKAuthentificationError>) -> Void) {
        
        var request = URLRequest(url: configuration.url!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        
        request.httpBody = registrationRequest.jsonData()
        
        print("===========================")
        print(request.url ?? "No url")
        print(request.allHTTPHeaderFields ?? "No headers")
        print(registrationRequest.jsonString() ?? "No params")
        print("===========================")
        
        let registrationTask = URLSession.shared.dataTask(with: request) { data, response, error in
            print(response ?? "No response")
            
            if let error = error {
                print("dataTask error: \(error)")
                callbackQueue.async {
                    completion(.failure(.timedOut(reason: error.localizedDescription)))
                }
                return
            }
            
            guard let data = data else {
                callbackQueue.async {
                    completion(.failure(.serializationFailed(reason: "Нет данных от сервера.")))
                }
                return
            }
            
            //guard let response = response as? HTTPURLResponse, (200 ... 299).contains(response.statusCode) else {
            //    callbackQueue.async {
            //        completion(.failure(.timedOut(reason: "")))
            //    }
            //    return
            //}
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(json)
            } catch {
                callbackQueue.async {
                    completion(.failure(.serializationFailed(reason: "Не удалось декодировать ответ сервера авторизации.")))
                }
            }
        }
        
        registrationTask.resume()
    }

}
