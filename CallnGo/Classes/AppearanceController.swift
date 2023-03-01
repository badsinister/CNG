/**
 
 Оформление элементов
 
 */

import UIKit

class AppearanceController {
    
    class func appearance(navigationBar: UINavigationBar) {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = .systemRed
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance
        //navigationBar.isTranslucent = false
    }
    
}
