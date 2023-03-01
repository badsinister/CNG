/**
 
 Базовый навигационный контроллер Сценариев.
 
 */
import UIKit
import StoreKit
import CNGKitUI

public class CNGScenariosNavigationController: CNGNavigationController<DSAnyActionsStore> {
    
    // MARK: - Initializerss
    
    public override init(store: DSAnyActionsStore) {
        super.init(store: store)
        self.viewControllers = [CNGScenariosViewController(actionsStore: store)]
    }
    
}
