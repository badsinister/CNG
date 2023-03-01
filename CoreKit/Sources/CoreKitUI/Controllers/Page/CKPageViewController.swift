/**
 
 Листание страниц (UIViewController)
 
 */

import UIKit

/// Предоставление контента для отображения
public protocol CKPageViewControllerDataSource: AnyObject {
    
    /// Настройка контента отображаемого контроллера
    ///
    /// - Parameters:
    ///   - pageViewController: Контроллер скролирующий содержимоу.
    ///   - viewController: Контроллер, отображающий содержимое для текущей даты.
    ///   - date: Дата для которой отображается содержимое.
    func pageViewController(_ pageViewController: CKPageViewController, prepare viewController: CKIndexable, for index: CKAnyIndex)
    
    /// Создание контроллера для отображения с заданным индексом
    ///
    /// - Parameters:
    ///   - pageViewController: Контроллер скролирующий содержимое.
    ///   - index: Индекс, для которого нужно создать контроллер.
    /// - Returns: Контроллер для отображения.
    func pageViewController(_ pageViewController: CKPageViewController, viewControllerAt index: CKAnyIndex) -> CKIndexable
    
    /// Оповещение о выборе контроллера текущим. Вызывается после окончания анимации смены контроллеров.
    /// 
    /// - Parameters:
    ///   - pageViewController: Контроллер скролирующий содержимое.
    ///   - viewController: Контроллер, выбранный текущим.
    func pageViewController(_ pageViewController: CKPageViewController, didSelectViewController viewController: CKIndexable)
    
}

open class CKPageViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    public weak var dataSource: CKPageViewControllerDataSource?
    
    /// Менеджер страниц
    public let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        self.pageViewController.delegate = self
        self.pageViewController.dataSource = self
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func loadView() {
        addChild(pageViewController)
        view = pageViewController.view
        pageViewController.didMove(toParent: self)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = CKStyle().color.customFill
    }
    
    /// Текущий индекс
    open var selectedIndex: CKAnyIndex {
        guard let currentPage = currentPage else {
            fatalError("Current Page not found")
        }
        return currentPage.index
    }
    
    /// Текущая отображаемая страница
    open var currentPage: CKIndexable? {
        return pageViewController.viewControllers?.first as? CKIndexable
    }
    
    /// Обновление содержимого экрана
    open func reload() {
        guard let currentPage = currentPage else { return }
        preparePage(currentPage, index: selectedIndex)
    }
    
    /// Переход на страницу с заданным индексом.
    open func setPage(at index: CKAnyIndex, direction: UIPageViewController.NavigationDirection = .forward, animated: Bool = false) {
        guard let viewController = makePage(index: index) as? UIViewController else { return }
        pageViewController.setViewControllers([viewController], direction: direction, animated: animated)
    }
    
    private func makePage(index: CKAnyIndex) -> CKIndexable {
        guard let viewController = dataSource?.pageViewController(self, viewControllerAt: index) else {
            fatalError("Indexable View Controller not found")
        }
        preparePage(viewController, index: index)
        return viewController
    }
    
    private func preparePage(_ viewController: CKIndexable, index: CKAnyIndex) {
        // Действия по предварительной подготовке контроллера
        dataSource?.pageViewController(self, prepare: viewController, for: index)
    }

    // MARK: - UIPageViewControllerDataSource
    
    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentViewController = viewController as? CKIndexable else {
            fatalError("Unexpected type")
        }
        guard let targetIndex = currentViewController.index.previous() else { return nil }
        return makePage(index: targetIndex) as? UIViewController
    }
    
    open func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentViewController = viewController as? CKIndexable else {
            fatalError("Unexpected type")
        }
        guard let targetIndex = currentViewController.index.next() else { return nil }
        return makePage(index: targetIndex) as? UIViewController
    }
    
    // MARK: - UIPageViewControllerDelegate
    
    open func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
        guard let viewController = pageViewController.viewControllers?.first as? CKIndexable else {
            fatalError("Unexpected type")
        }
        // Выбран контроллер с индексом viewController.index
        dataSource?.pageViewController(self, didSelectViewController: viewController)
    }

}
