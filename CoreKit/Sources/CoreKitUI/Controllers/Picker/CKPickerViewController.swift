
import UIKit

public protocol CKPickerViewControllerDelegate: AnyObject {
    
    func pickerViewController(_ pickerViewController: UIViewController, didSelectItems selectedItems: [CKAnyPickerItem]?)
    
    func pickerViewControllerWillClose(_ pickerViewController: UIViewController)
    
}

public extension CKPickerViewControllerDelegate {

    func pickerViewControllerWillClose(_ pickerViewController: UIViewController) {
        pickerViewController.dismiss(animated: true)
    }

}

/// Модальный контроллер работы со списком. Корневой контроллер `UINavigationController`
open class CKPickerViewController: UINavigationController {

    /// Получатель уведомлений `CKPickerViewController`.
    public weak var pickerDelegate: CKPickerViewControllerDelegate?

    /// Инициализация контроллера работы со списками элементов `CKAnyPickerItem`.
    /// - Parameters:
    ///   - title: Заголовок окна. Отображается в навигационной строке окна.
    ///   - items: Список элементов `CKAnyPickerItem` для отображения.
    ///   - selectedItems: Выбранные поумолчанию элементы списка.
    ///   - delegate: Получатель событий окна писка.
    public init(title: String?, items: [CKAnyPickerItem], selectedItems: [CKAnyPickerItem]? = nil, delegate: CKPickerViewControllerDelegate? = nil) {
        let viewController = CKPickerListViewController(items: items, selectedItems: selectedItems)
        viewController.navigationItem.title = title
        super.init(rootViewController: viewController)
        self.isToolbarHidden = false
        self.pickerDelegate = delegate
        setup()
    }
    
    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        /// Кнопка отмена (закрыть окно)
        topViewController?.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(willClose))
        topViewController?.navigationItem.leftBarButtonItem?.tintColor = CKStyle().color.customGray
        /// Кнопка Добавить (+)
        topViewController?.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(willSelectItems))
    }
    
    @objc
    func willClose() {
        pickerDelegate?.pickerViewControllerWillClose(self)
    }
    
    @objc
    func willSelectItems() {
        pickerDelegate?.pickerViewController(self, didSelectItems: (viewControllers.first as? CKPickerListViewController)?.selectedItems)
    }
    
}

/// Контроллер для работы со списками элементов.
/// Элементы должны соответствовать протоколу CKAnyPickerItem.
open class CKPickerListViewController: CKListViewController {
    
    // MARK: Properties
    
    /// Данные для отображения.
    private let items: [CKAnyPickerItem]

    /// Выбранные элементы.
    public var selectedItems: [CKAnyPickerItem]

    /// Кнопка поиск
    private var selectButton = UIBarButtonItem(title: "Deselect all", style: .plain, target: nil, action: nil)

    /// Контроллер поиска
    private var searchController: UISearchController!

    // MARK: - Initializers
    
    /// Инициализация с использованием списка элементов.
    ///
    /// - Parameters:
    ///   - items: Список элементов для отображения.
    ///   - selectedItems: Выбранные элементы.
    public init(items: [CKAnyPickerItem], selectedItems: [CKAnyPickerItem]? = nil) {
        self.items = items
        self.selectedItems = selectedItems ?? []
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle

    override open func viewDidLoad() {
        super.viewDidLoad()
        setToolbarItems([UIBarButtonItem(systemItem: .flexibleSpace), selectButton], animated: false)
        setupGestures()
        setupSearchController()
        reloadData()
        
        // Style
        selectButton.tintColor = CKStyle().color.customGray
    }
    
    // MARK: - Methods
    
    private func setupGestures() {
        [selectButton].forEach {
            $0.target = self
            $0.action = #selector(didTapButton(_:))
        }
    }
    
    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.searchBar.delegate = self // Monitor when the search button is tapped.
        
        searchController.searchBar.scopeButtonTitles = ["All", "Selected"]
        
        // Place the search bar in the navigation bar.
        navigationItem.searchController = searchController
        
        // Make the search bar always visible.
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = true
        
        /** Search presents a view controller by applying normal view controller presentation semantics.
         This means that the presentation moves up the view controller hierarchy until it finds the root
         view controller or one that defines a presentation context.
         */
        
        /** Specify that this view controller determines how the search controller is presented.
         The search controller should be presented modally and match the physical size of this view controller.
         */
        definesPresentationContext = true
    }

    /// Обновление данных.
    private func reloadData() {
        items.forEach { item in
            let view = CKHeaderView() {
                $0.detailDisclosureStyle = selectedItems.contains { $0.id == item.id } ? .checkmark : .circle
                //$0.detailDisclosureStyle = .checkmark
                $0.showsDetailText = false
                $0.showsSeparator = true
            }
            view.titleLabel.text = item.text
            view.detailLabel?.text = item.secondaryText
            appendView(view, animated: false)
        }
    }

    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case selectButton:
            toggleSelectedItems()
        default: fatalError("Target not set up properly")
        }
    }
    
    /// Выбор / Снятие выбора элементов
    private func toggleSelectedItems() {
        if selectedItems.isEmpty {
            selectedItems = items
            selectButton.title = "Deselect All"
        } else {
            selectedItems.removeAll()
            selectButton.title = "Select All"
        }
        
        for (index, item) in items.enumerated() {
            let headerView = listView.stackView.arrangedSubviews[index]
            if selectedItems.contains(where: { $0.id == item.id }) {
                headerView.backgroundColor = .red
            } else {
                headerView.backgroundColor = .green
            }
        }
    }

}

// MARK: - UISearchBarDelegate

extension CKPickerListViewController: UISearchBarDelegate {
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    public func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        //updateSearchResults(for: searchController)
    }
    
}

// MARK: - UISearchControllerDelegate

// Use these delegate functions for additional control over the search controller.

extension CKPickerListViewController: UISearchControllerDelegate {
    
    public func presentSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    public func willPresentSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    public func didPresentSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    public func willDismissSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    public func didDismissSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
}

extension CKPickerListViewController: UISearchResultsUpdating {
    
    public func updateSearchResults(for searchController: UISearchController) {
        print(searchController)
    }
    
}
