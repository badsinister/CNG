
import UIKit
import StoreKit
import CoreKitUI
import Combine

/// Список организаций с возможностью выбора и поиска по списку.
class CNGOrganizationsViewController: CKViewController<CNGOrganizationsDataProvider, CNGOrganizationsViewSynchronizer> {
    
    var coordinator: CNGOrganizationsNavigationController? {
        return navigationController as? CNGOrganizationsNavigationController
    }

    private var titleLabel = {
        let label = CKLabel(textStyle: .body, weight: .regular)
        label.text = "Organizations"
        return label
    }()
    
    private var segmentedControl = UISegmentedControl(items: ["All", "Favorited"])
    
    /// Кнопка Добавить (+)
    private var addButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: nil, action: nil)
    /// Кнопка поиск
    private var searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: nil, action: nil)
    
    /// Контроллер поиска
    private var searchController: UISearchController!
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    
    public init(store: DSAnyOrganizationsStore) {
        super.init(viewSynchronizer: CNGOrganizationsViewSynchronizer(), dataProvider: CNGOrganizationsDataProvider(store: store))
    }
    
    // MARK: - Life cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        contentView.delegate = self
        segmentedControl.selectedSegmentIndex = 0
        setup()
        startObservingDataContext()
    }
    
    // MARK: - Make View
    
    private func setup() {
        addSubviews()
        styleSubviews()
        setupGestures()
        setupSearchController()
    }
    
    private func addSubviews() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.rightBarButtonItems = [addButton, searchButton]
        navigationItem.titleView = segmentedControl
    }
    
    private func styleSubviews() {
        let style = contentView.style()
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
        segmentedControl.addTarget(self, action: #selector(didTapSegmentControl(_:)), for: .valueChanged)
        [addButton, searchButton].forEach {
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
        
        searchController.searchBar.scopeButtonTitles = ["all", "birthdays", "weddings"]
        
        // Place the search bar in the navigation bar.
        //navigationItem.searchController = searchController
        
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
    
    @objc
    private func didTapSegmentControl(_ sender: UIControl) {
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case addButton:
            break
        case searchButton:
            if navigationItem.searchController == nil {
                navigationItem.searchController = searchController
                searchController.isActive = true
            } else {
                navigationItem.searchController = nil
                searchController.isActive = false
            }
        default: fatalError("Target not set up properly")
        }
    }
    
    override open func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        styleSubviews()
    }
    
    private func startObservingDataContext() {
        dataProvider.$organizations.sink { [weak self] in
            dump($0)
            dump(self!.dataProvider.organizations)
            let context = CNGOrganizationsDataContext(model: $0 as? [DSOrganization])
            self?.updateView(with: context)
        }.store(in: &cancellables)
    }
    
}

// MARK: - UISearchBarDelegate

extension CNGOrganizationsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        //updateSearchResults(for: searchController)
    }
    
}

// MARK: - UISearchControllerDelegate

// Use these delegate functions for additional control over the search controller.

extension CNGOrganizationsViewController: UISearchControllerDelegate {
    
    func presentSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    func willDismissSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        //Swift.debugPrint("UISearchControllerDelegate invoked method: \(#function).")
    }
    
}

extension CNGOrganizationsViewController: UISearchResultsUpdating {

    func updateSearchResults(for searchController: UISearchController) {
        print(searchController)
    }

}

// MARK: - CNGOrganizationsView Delegate

extension CNGOrganizationsViewController: CNGOrganizationsViewDelegate {

    func organizationsView(_ organizationsView: CNGOrganizationsView, willShowOrganizationType sender: Any?) {
    }
    
    func organizationsView(_ organizationsView: CNGOrganizationsView, willShowTarget sender: Any?) {
    }
    
    func organizationsView(_ organizationsView: CNGOrganizationsView, didSelectOrganizationAt indexPath: IndexPath, sender: Any?) {
        guard let organization = viewSynchronizer.item(for: indexPath) else { return }
        coordinator?.show(organization)
    }
    
}
