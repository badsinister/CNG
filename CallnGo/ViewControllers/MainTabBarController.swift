
import UIKit
import SwiftUI

/// Основной контроллер вкладок, содержащий контроллеры разделов.
/// Переключение между вкладками происходит посредством контроллера `BarViewController`
class MainTabBarController: UITabBarController {
    
    /// Инициализация контроллера. Поумолчанию выбирается первый переданный контроллер в параметре `controllers`. Для выбора произвольного контроллера необходимо использовать метод `selectController`.
    /// - Parameter sections: Контроллеры для отображения. Поумолчанию выбирается первый.
    init(controllers: [UIViewController]? = nil) {
        super.init(nibName: nil, bundle: nil)
        setup()
        viewControllers = controllers
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    /// Настройка параметров контроллера
    private func setup() {
        tabBar.isHidden = true
    }
    
    /// Установка отображения контроллера по заданному индексу.
    /// - Parameter index: Индекс нового контроллера для отображения в списке контроллеров.
    func selectController(at index: Int) {
        guard index != selectedIndex, let viewControllersCount = viewControllers?.count, (0 ..< viewControllersCount).contains(index) else {
            return
        }
        selectedIndex = index
    }

}

extension MainTabBarController: SectionsManagerDelegate {

    func sectionsManager(_ manager: SectionsManager, didSelectSectionAt index: Int) {
        selectController(at: index)
    }

}

// MARK: - Preview

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreviewer {
            MainTabBarController()
        }
    }
}
