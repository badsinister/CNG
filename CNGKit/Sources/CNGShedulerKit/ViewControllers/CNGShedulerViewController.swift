/**
 
 Планировщик.
 
 */

import UIKit
import CoreKitUI
import StoreKit
import CNGKitUI

public class CNGShedulerViewController: CNGPageViewController<CNGStepperControlView>, CKPageViewControllerDataSource, CNGStepperControlViewDelegate {
    
    var coordinator: CNGShedulerNavigationController? {
        return navigationController as? CNGShedulerNavigationController
    }

    private var titleLabel = {
        let label = CKLabel(textStyle: .body, weight: .regular)
        label.text = "Calendar"
        return label
    }()

    private var segmentedControl = UISegmentedControl(items: ["Day", "Weak", "Month", "Year"])

    /// Вид календаря
    private var calendarButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), style: .plain, target: nil, action: nil) // calendar
    /// Кнопка карта
    private let mapButton = UIBarButtonItem(image: UIImage(systemName: "map"), style: .plain, target: nil, action: nil)

    /// Кнопка Добавить (+)
    private let addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: nil, action: nil)
    /// Кнопка поиск
    private let searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: nil, action: nil)
    
    // MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        navigationItem.backButtonTitle = ""
        segmentedControl.selectedSegmentIndex = 0
        dataSource = self
        headerView.delegate = self
        
        setPage(at: CNGShedulerPageIndex())
        
        pageViewController.accessibilityHint = "Calendar"
    }
    
    public override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        styleSubviews()
    }
    
    // MARK: - Make View

    private func setup() {
        addSubviews()
        styleSubviews()
        setupGestures()
    }

    private func addSubviews() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.rightBarButtonItems = [addButton, searchButton, makeSeparator(), mapButton, calendarButton]
        navigationItem.titleView = segmentedControl
    }
    
    /// Создание элемента разделителя `|` для кнопок в панели навигации.
    /// - Returns: Разделитель, объект класса `UIBarButtonItem`.
    private func makeSeparator() -> UIBarButtonItem {
        let label = CKLabel(textStyle: .title1, weight: .thin)
        label.text = "|"
        label.textColor = CKStyle().color.separator
        label.alpha = 0.4
        return UIBarButtonItem(customView: label)
    }

    private func styleSubviews() {
        let style = CKStyle()
        segmentedControl.selectedSegmentTintColor = style.color.customRed
        segmentedControl.setTitleTextAttributes([.foregroundColor: style.color.customBlack], for: .selected)
        
        switch view.traitCollection.userInterfaceStyle {
        case .dark:
            titleLabel.textColor = style.color.customBlack
            segmentedControl.setTitleTextAttributes([.foregroundColor: style.color.customBlack], for: .normal)
        case .light, .unspecified:
            titleLabel.textColor = style.color.customWhite
            segmentedControl.setTitleTextAttributes([.foregroundColor: style.color.customWhite], for: .normal)
        @unknown default: titleLabel.textColor = style.color.customWhite
        }
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
        case addButton:
            print("addButton")
        case searchButton:
            print("searchButton")
        case mapButton:
            print("mapButton")
        case calendarButton:
            calendarButton = UIBarButtonItem(image: UIImage(systemName: "calendar"), style: .plain, target: self, action: #selector(didTapButton(_:)))
            navigationItem.rightBarButtonItems = [addButton, searchButton, makeSeparator(), mapButton, calendarButton]
        default: fatalError("Target not set up properly")
        }
    }

    public override func setPage(at index: CKAnyIndex, direction: UIPageViewController.NavigationDirection = .forward, animated: Bool = false) {
        super.setPage(at: index, direction: direction, animated: animated)
        headerView.titleLabel.text = (index as? CNGShedulerPageIndex)?.title
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
        headerView.titleLabel.text = (viewController.index as? CNGShedulerPageIndex)?.title
    }

    // MARK: - CNGStepperControlViewDelegate
    
    public func headerViewWillSelectNextValue(_ headerView: CNGStepperControlView) {
        guard let pageIndex = selectedIndex.next() else { return }
        setPage(at: pageIndex, direction: .forward, animated: true)
    }

    public func headerViewWillSelectPreviousValue(_ headerView: CNGStepperControlView) {
        guard let pageIndex = selectedIndex.previous() else { return }
        setPage(at: pageIndex, direction: .reverse, animated: true)
    }

}
