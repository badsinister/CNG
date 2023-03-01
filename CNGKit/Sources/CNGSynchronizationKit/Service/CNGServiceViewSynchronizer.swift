/**
 
 Создание и обновление вида Окна Синхронизации.
 
 */

import UIKit
import CoreKitUI

class CNGServiceViewSynchronizer: CKAnyViewSynchronizer {
    
    func makeView() -> CNGServiceView {
        return CNGServiceView()
    }
    
    func updateView(_ view: CNGServiceView, context: CNGSynchronizationDataContext) {
    }
    
}
