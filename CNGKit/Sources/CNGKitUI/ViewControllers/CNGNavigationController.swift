/**
 
 Основной контроллер навигации.
 
 */

import UIKit
import CoreKitUI
import ResourcesKit

/// Корневой навигационный контроллер секции. Применяется для построения разделов.
open class CNGNavigationController<DataStore>: UINavigationController {
    
    public var store: DataStore
    
    public init(store: DataStore) {
        self.store = store
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Кастомизация строки навигации
        navigationBar.backgroundColor = RKPalette.secondaryFill.color
        navigationBar.titleTextAttributes = [.foregroundColor: RKPalette.white.color]
        navigationBar.barStyle = .black
        navigationBar.isTranslucent = false
        
        navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        navigationBar.shadowImage = nil
    }

}
