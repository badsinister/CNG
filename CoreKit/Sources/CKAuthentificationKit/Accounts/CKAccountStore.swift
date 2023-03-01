/**
 
 Хранилище данных аккаунтов пользователя.
 
 */

import Foundation

public class CKAccountStore {

    private var accounts: [CKAccount]!

    init() {
        self.accounts = [CKAccount]()
    }
    
    func account(withIdentifier identifier: String) -> CKAccount? {
        return accounts.filter {
            $0.identifier == identifier
        }.first
    }

    /// Сохранение аккаунта в хранилище
    /// - Parameters:
    ///   - account: Аккаунт, который нобходимо сохранить.
    ///   - completion: Результат сохранения. True если сохранено успешно, False и Error в случае ошибки.
    func saveAccount(_ account: CKAccount, _ completion: (Bool, Error) -> Void) {
        accounts.append(account)
    }

    /// Удаление аккаунта из хранилища
    /// - Parameters:
    ///   - account: Аккаунт, который нужно удалить из хранилища.
    ///   - completion: Результат удаление. True если удалено успешно, False и Error в случае ошибки.
    func removeAccount(_ account: CKAccount, _ completion: (Bool, Error) -> Void) {
        guard let index = accounts.firstIndex(where: { $0.identifier == account.identifier }) else {
            return
        }
        accounts.remove(at: index)
    }

}
