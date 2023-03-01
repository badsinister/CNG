/**
 
 Базовый навигационный контроллер Планировщика.
 
 */
import UIKit
import StoreKit
import CoreKitUI
import CNGKitUI

public class CNGShedulerNavigationController: CNGNavigationController<DSAnyEventsStore> {

    public init(store: DSStore) {
        super.init(store: store)
        self.viewControllers = [CNGShedulerViewController(headerView: CNGStepperControlView())]
    }

    /// Создание Отображения для карусели видов.
    /// - Parameter pageIndex: Позиция UIViewController в карусели видов.
    /// - Returns: UIViewController для отображения в карусели видов.
    public func makeViewController(for pageIndex: CKAnyIndex) -> UIViewController {
        return CNGEventsViewController(store: store, index: pageIndex)
    }
    
    /// Создание Отображения для карусели видов.
    /// - Parameter pageIndex: Позиция UIViewController в карусели видов.
    /// - Returns: UIViewController для отображения в карусели видов.
    public func makeEventViewController(for pageIndex: CKAnyIndex) -> UIViewController {
        guard let pageIndex = pageIndex as? CNGDetailedEventPageIndex else {
            fatalError("Unexpected type")
        }
        var viewController: UIViewController
        switch pageIndex {
        case .main:
            viewController = CNGEventViewController(dataProvider: CNGEventDataProvider(contactID: "", store: store as! DSStore), index: CNGDetailedEventPageIndex.main)
        case .results:
            viewController = CNGResultViewController(dataProvider: CNGEventDataProvider(contactID: "", store: store as! DSStore), index: CNGDetailedEventPageIndex.results)
        }
        return viewController
    }

    public func show(_ event:  DSAnyEvent) {
        let viewController = CNGDetailedEventViewController(eventID: "")
        pushViewController(viewController, animated: true)
    }
    
}
