/**
 
 Создание и обновление вида событие.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI
import StoreKit

public class CNGCreateEventViewSynchronizer: CKAnyViewSynchronizer {
    
    public func makeView() -> CNGCreateEventView {
        return CNGCreateEventView()
    }
    
    public func updateView(_ view: CNGCreateEventView, context: CNGDataContext<[DSEventType]>) {
    }
    
}
