/**
 
 Базовый навигационный контроллер Библиотеки.
 
 */

import UIKit
import StoreKit
import CNGKitUI
import ResourcesKit

public class CNGLibraryNavigationController: CNGNavigationController<DSAnyLibraryStore> {
    
    public override init(store: DSAnyLibraryStore) {
        let viewControllers = [CNGFilesViewController(store: store), CNGPresentationsViewController(store: store)]
        super.init(store: store)
        self.viewControllers = [CNGLibraryViewController(viewControllers: viewControllers)]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
