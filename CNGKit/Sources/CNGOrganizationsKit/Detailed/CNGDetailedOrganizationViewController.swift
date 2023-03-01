/**
 
 Страница контакта.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI
import StoreKit

public class CNGDetailedOrganizationViewController: CNGPageViewController<CNGSegmentedControlView>, CKPageViewControllerDataSource, CNGSegmentedControlViewDelegate {

    let detailedOrganization: CNGDetailedOrganization

    /// Контроллер для работы с данными.
    private let dataProvider: CNGOrganizationDataProvider

    /// Кнопка Удалить
    private var deleteButton = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: nil, action: nil)
    /// Кнопка Редактировать
    private var editButton = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .plain, target: nil, action: nil)
    /// Кнопка Добавить событие
    private var addEventButton = UIBarButtonItem(image: UIImage(systemName: "calendar.badge.plus"), style: .plain, target: nil, action: nil)
    
    // MARK: - Initializers
    
    public init(organization: DSAnyOrganization, store: DSAnyOrganizationsStore) {
        self.detailedOrganization = .organization(organization)
        self.dataProvider = CNGOrganizationDataProvider(with: organization, store: store)
        super.init(headerView: CNGDetailedOrganizationViewController.makeSegmentedControlView())
    }
    
    public init(organizationID: String, store: DSAnyOrganizationsStore) {
        self.detailedOrganization = .organizationID(organizationID)
        self.dataProvider = CNGOrganizationDataProvider(withID: organizationID, store: store)
        super.init(headerView: CNGDetailedOrganizationViewController.makeSegmentedControlView())
    }
    
    // MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        navigationItem.backButtonTitle = ""
        navigationItem.title = "Фамилия Имя Отчество"
        dataSource = self
        headerView.delegate = self
        
        let viewController = makeViewController(for: CNGDetailedOrganizationPageIndex.main)
        pageViewController.setViewControllers([viewController], direction: .forward, animated: false)
        pageViewController.accessibilityHint = "Фамилия Имя Отчество"
    }
    
    // MARK: - Make View
    
    private func setup() {
        addSubviews()
        setupGestures()
    }
    
    private func addSubviews() {
        navigationItem.rightBarButtonItems = [deleteButton, editButton, addEventButton]
    }
    
    private func setupGestures() {
        navigationItem.rightBarButtonItems?.forEach {
            $0.target = self
            $0.action = #selector(didTapButton(_:))
        }
    }
    
    /// Создает вид меню элементов управления.
    /// - Returns: Вид меню элементов управления.
    private static func makeSegmentedControlView() -> CNGSegmentedControlView {
        let indexes = CNGDetailedOrganizationPageIndex.allCases.map { $0.title }
        return CNGSegmentedControlView(items: indexes)
    }

    
    /// Создание контполлера для карусели `CNGPageViewController`
    /// - Parameter pageIndex: Индекс контроллера для отображения `CNGDetailedOrganizationPageIndex`.
    /// - Returns: Контроллер для отображения.
    public func makeViewController(for pageIndex: CKAnyIndex) -> UIViewController {
        guard let pageIndex = pageIndex as? CNGDetailedOrganizationPageIndex else {
            fatalError("Unexpected pageIndex type")
        }
        var viewController: UIViewController
        switch pageIndex {
        case .main:
            viewController = CNGOrganizationViewController(dataProvider: dataProvider, index: .main)
        case .map:
            viewController = CNGMapViewController(dataProvider: dataProvider, index: .map)
        case .contacts:
            viewController = CNGOrganizationViewController(dataProvider: dataProvider, index: .contacts)
        case .events:
            viewController = CNGOrganizationViewController(dataProvider: dataProvider, index: .events)
        }
        return viewController
    }

    // MARK: - Actions
    
    @objc
    private func didTapButton(_ sender: UIBarButtonItem) {
        switch sender {
        case addEventButton:
            let viewController = UINavigationController(rootViewController: UIViewController())
            viewController.modalPresentationStyle = .popover
            if #available(iOS 16.0, *) {
                viewController.popoverPresentationController?.sourceItem = sender
            } else {
                viewController.popoverPresentationController?.barButtonItem = sender
            }
            present(viewController, animated: true)
        case editButton:
            print("editButton")
        case deleteButton:
            print("deleteButton")
        default: fatalError("Target not set up properly")
        }
    }
    
    // MARK: - CKPageViewControllerDataSource
    
    public func pageViewController(_ pageViewController: CKPageViewController, prepare viewController: CKIndexable, for index: CKAnyIndex) {
    }
    
    public func pageViewController(_ pageViewController: CKPageViewController, viewControllerAt index: CKAnyIndex) -> CKIndexable {
        guard let viewController = makeViewController(for: index) as? CKIndexable else {
            fatalError()
        }
        return viewController
    }
    
    public func pageViewController(_ pageViewController: CKPageViewController, didSelectViewController viewController: CKIndexable) {
        guard let pageIndex = viewController.index as? CNGDetailedOrganizationPageIndex, let index = CNGDetailedOrganizationPageIndex.allCases.firstIndex(of: pageIndex) else { return }
        headerView.segmentedControl.selectedSegmentIndex = index
    }

    // MARK: - CNGSegmentedControlViewDelegate
    
    public func headerView(_ headerView: CNGSegmentedControlView, didSelect value: Int) {
        var direction: UIPageViewController.NavigationDirection = .forward
        if let index = selectedIndex as? CNGDetailedOrganizationPageIndex, let oldValue = CNGDetailedOrganizationPageIndex.allCases.firstIndex(of: index), oldValue > value {
            direction = .reverse
        }
        setPage(at: CNGDetailedOrganizationPageIndex.allCases[value], direction: direction, animated: true)
    }

}
