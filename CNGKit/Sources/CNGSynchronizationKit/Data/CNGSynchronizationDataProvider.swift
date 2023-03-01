/**
 
 Контроллер данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

class CNGSynchronizationDataProvider: CKAnyDataProvider {
    
    @Published var synchronizationState: CNGSynchronizationState = CNGSynchronizationState()
    
    /// Извлечение данных из хранилища.
    func fetchData(_ completion: (() -> Void)? = nil) {
        synchronizationState = CNGSynchronizationState(synchronizationDate: Date())
    }
    
    // MARK: - Synchronization
    
    /// Запуск синхронизации.
    func startSynchronization() {
        
    }

    /// Отмена синхронизации.
    func dismissSynchronization() {
        
    }
    
}
