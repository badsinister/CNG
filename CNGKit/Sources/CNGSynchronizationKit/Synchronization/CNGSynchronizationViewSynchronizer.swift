/**
 
 Создание и обновление вида Синхронизации.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI
import StoreKit

class CNGSynchronizationViewSynchronizer: CKAnyViewSynchronizer {
    
    func makeView() -> CNGSynchronizationView {
        return CNGSynchronizationView()
    }
    
    func updateView(_ view: CNGSynchronizationView, context: CNGDataContext<CNGSynchronizationState>) {
        if let synchronizationDate = context.model.synchronizationDate {
            view.datetimeLabel.text = DateFormatter.localizedString(from: synchronizationDate, dateStyle: .full, timeStyle: .short)
        } else {
            view.datetimeLabel.text = "Synchronization was not done"
        }
        view.versionLabel.text = "Version 0.0.0"
    }
}
