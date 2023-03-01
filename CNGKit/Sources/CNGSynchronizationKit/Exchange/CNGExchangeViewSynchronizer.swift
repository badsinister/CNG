/**
 
 Создание и обновление вида Окна Синхронизации.
 
 */

import UIKit
import CoreKitUI
import StoreKit

class CNGExchangeViewSynchronizer: CKAnyViewSynchronizer {
    
    func makeView() -> CNGExchangeView {
        return CNGExchangeView()
    }
    
    func updateView(_ view: CNGExchangeView, context: CNGSynchronizationDataContext) {
        view.progressView.progress = 0.3
        view.activityIndicatorView.startAnimating()
        view.messageLabel.text = "Synchronization is starting..."
    }
}
