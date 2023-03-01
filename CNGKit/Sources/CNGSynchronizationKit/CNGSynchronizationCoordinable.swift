
import Foundation

/// Протокол управления экранами раздела синхронизации.
public protocol CNGSynchronizationCoordinable {
    
    /// Открытие окна обмена данными с сервером.
    func presentExchangeViewController()
    
    /// Открытие сервисного окна.
    func presentServiceViewController()
    
}
