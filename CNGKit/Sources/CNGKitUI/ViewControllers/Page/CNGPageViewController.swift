/**
 
 Листание страниц (UIViewController) с видом элементов управления.
 
 */

import UIKit
import CoreKitUI

open class CNGPageViewController<HeaderView: UIView>: CKPageViewController {
    
    /// Заголовок страницы
    public let headerView: HeaderView
    
    public init(headerView: HeaderView) {
        self.headerView = headerView
        super.init()
    }
    
    open override func loadView() {
        addChild(pageViewController)
        view = CNGPageView(headerView: headerView, bodyView: pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
}
