/**
 
 Страница контакта.
 
 */

import UIKit
import CoreKitUI
import StoreKit
import CNGKitUI

public class CNGDetailedContactViewController: CNGPageViewController<CNGSegmentedControlView>, CKPageViewControllerDataSource, CNGSegmentedControlViewDelegate {

    var coordinator: CNGContactsNavigationController? {
        return navigationController as? CNGContactsNavigationController
    }

    /// Кнопка Удалить
    private var deleteButton = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: nil, action: nil)
    /// Кнопка Редактировать
    private var editButton = UIBarButtonItem(image: UIImage(systemName: "pencil"), style: .plain, target: nil, action: nil)
    /// Кнопка Добавить событие
    private var addEventButton = UIBarButtonItem(image: UIImage(systemName: "calendar.badge.plus"), style: .plain, target: nil, action: nil)

    public init(contactID: String) {
        let indexes = CNGDetailedContactPageIndex.allCases.map { $0.title }
        let segmentedControlView = CNGSegmentedControlView(items: indexes)
        super.init(headerView: segmentedControlView)
    }
    
    // MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        navigationItem.backButtonTitle = ""
        navigationItem.title = "Фамилия Имя Отчество"
        dataSource = self
        headerView.delegate = self
        
        setPage(at: CNGDetailedContactPageIndex.main)

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
    
    @objc
    private func didTapButton(_ sender: UIBarButtonItem) {
        switch sender {
        case addEventButton:
            coordinator?.showCreateEventViewController(sender: sender)
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
        guard let viewController = coordinator?.makeViewController(for: index) as? CKIndexable else {
            fatalError()
        }
        return viewController
    }
    
    public func pageViewController(_ pageViewController: CKPageViewController, didSelectViewController viewController: CKIndexable) {
        guard let pageIndex = viewController.index as? CNGDetailedContactPageIndex, let index = CNGDetailedContactPageIndex.allCases.firstIndex(of: pageIndex) else { return }
        headerView.segmentedControl.selectedSegmentIndex = index
    }

    // MARK: - CNGSegmentedControlViewDelegate
    
    public func headerView(_ headerView: CNGSegmentedControlView, didSelect value: Int) {
        var direction: UIPageViewController.NavigationDirection = .forward
        if let index = selectedIndex as? CNGDetailedContactPageIndex, let oldValue = CNGDetailedContactPageIndex.allCases.firstIndex(of: index), oldValue > value {
            direction = .reverse
        }
        setPage(at: CNGDetailedContactPageIndex.allCases[value], direction: direction, animated: true)
    }
    
}
