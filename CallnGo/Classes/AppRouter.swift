
import UIKit

/// Управление переходами экранов приложения.
class AppRouter {
    
    var window: UIWindow?
    
    init(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
    }
    
    func start() {
        window?.rootViewController = LayoutViewController()
        window?.tintColor = UIColor { $0.userInterfaceStyle == .light ? #colorLiteral(red: 0.9960784314, green: 0.3725490196, blue: 0.368627451, alpha: 1) : #colorLiteral(red: 0.8627432641, green: 0.2630574384, blue: 0.2592858295, alpha: 1) }
        window?.makeKeyAndVisible()
        //authorize()
    }
    
    func authorize(animated: Bool = false) {
        let authenticationViewController = AuthenticationViewController()
        authenticationViewController.modalPresentationStyle = .fullScreen
        window?.rootViewController?.present(authenticationViewController, animated: animated)
    }
    
}
