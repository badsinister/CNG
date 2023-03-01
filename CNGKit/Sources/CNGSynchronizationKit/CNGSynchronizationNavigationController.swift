/**
 
 Базовый навигационный контроллер Синхронизация.
 
 */
import UIKit
import StoreKit
import CNGKitUI

/// Синхронизация. Контроллер навигации экранов.
public class CNGSynchronizationNavigationController: CNGNavigationController<DSAnyStore> {
    
    // MARK: - Initializerss
    
    public override init(store: DSAnyStore) {
        super.init(store: store)
        self.viewControllers = [CNGSynchronizationViewController()]
    }
    
    /// Открывает модальный контроллер.
    /// - Parameter viewController: Модальный контроллер для отображения.
    func present(_ viewController: UIViewController) {
        viewController.modalPresentationStyle = .formSheet // .popover -> sourceView | barButtonItem
        topViewController?.present(viewController, animated: true)
    }

}

// MARK: - Coordinator

extension CNGSynchronizationNavigationController: CNGSynchronizationCoordinable {

    public func presentExchangeViewController() {
        present(CNGExchangeViewController())
    }

    public func presentServiceViewController() {
        present(CNGServiceViewController())
    }
    
}
