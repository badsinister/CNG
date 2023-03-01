/**
 
 Переключение страниц (UIViewController)
 
 */

import UIKit
import CoreKitUI

open class CNGLibraryViewController: UIViewController {
    
    private var titleLabel = {
        let label = CKLabel(textStyle: .body, weight: .regular)
        label.text = "Library"
        return label
    }()

    private let stackView = CKStackView.vertical()
    
    private let separatorView = CKSeparatorView()

    private var segmentedControl = UISegmentedControl(items: ["Files", "Presentations"])
    
    /// Кнопка Фильтр
    private var filterButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal.decrease"), style: .plain, target: nil, action: nil)
    /// Кнопка поиск
    private var searchButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: nil, action: nil)
    
    /// Контроллер поиска
    private var searchController: UISearchController!

    /// Менеджер страниц
    public let tabsController = UITabBarController(nibName: nil, bundle: nil)
    
    public init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.tabsController.setViewControllers(viewControllers, animated: false)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
/*
    open override func loadView() {
        addChild(tabsController)
        view = tabsController.view
        tabsController.didMove(toParent: self)
    }
*/
    open override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        view.backgroundColor = CKStyle().color.customFill
        setup()
        segmentedControl.selectedSegmentIndex = 0
    }
    
    // MARK: - Make View
    
    private func setup() {
        addSubviews()
        constrainSubviews()
        styleSubviews()
        setupGestures()
        setupSearchController()
    }
    
    private func addSubviews() {
        addChild(tabsController)
        [separatorView, tabsController.view].forEach { stackView.addArrangedSubview($0) }
        view.addSubview(stackView)
        tabsController.didMove(toParent: self)

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleLabel)
        navigationItem.rightBarButtonItems = [filterButton, searchButton]
        navigationItem.titleView = segmentedControl
    }

    private func constrainSubviews() {
        [stackView, separatorView, tabsController.view].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate(stackView.constraints(equalTo: view))
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
        segmentedControl.addTarget(self, action: #selector(didTapSegmentControl(_:)), for: .valueChanged)
        [filterButton, searchButton].forEach {
            $0.target = self
            $0.action = #selector(didTapButton(_:))
        }
    }
    
    private func setupSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        //searchController.delegate = self
        //searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        //searchController.searchBar.delegate = self // Monitor when the search button is tapped.
        
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
    private func didTapSegmentControl(_ sender: UISegmentedControl) {
        tabsController.selectedIndex = sender.selectedSegmentIndex
    }
    
    @objc
    private func didTapButton(_ sender: UIControl) {
        switch sender {
        case filterButton:
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

}
