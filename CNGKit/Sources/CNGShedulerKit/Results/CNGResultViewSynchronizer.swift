/**
 
 Создание и обновление вида Результаты события.
 
 */

import UIKit
import CoreKitUI
import StoreKit

class CNGResultViewSynchronizer: CKAnyViewSynchronizer {
    
    func makeView() -> CNGResultView {
        return CNGResultView()
    }
    
    func updateView(_ view: CNGResultView, context: CNGEventDataContext) {
        //let event = context.model
        view.titleLabel.text = "Comment"
    }
    
}
