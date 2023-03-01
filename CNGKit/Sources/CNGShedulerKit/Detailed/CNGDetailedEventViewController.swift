/**
 
 Страница события.
 
 */

import UIKit
import CoreKitUI
import StoreKit
import CNGKitUI

public class CNGDetailedEventViewController: CNGPageViewController<CNGSegmentedControlView>, CKPageViewControllerDataSource, CNGSegmentedControlViewDelegate {
    
    var coordinator: CNGShedulerNavigationController? {
        return navigationController as? CNGShedulerNavigationController
    }
    
    /// Кнопка Удалить
    private var moreButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis", orientation: .right), style: .plain, target: nil, action: nil)

    private var actionButton = UIBarButtonItem(title: "Start", style: .plain, target: nil, action: nil)

    public init(eventID: String) {
        let indexes = CNGDetailedEventPageIndex.allCases.map { $0.title.uppercased() }
        let segmentedControlView = CNGSegmentedControlView(items: indexes)
        super.init(headerView: segmentedControlView)
    }
    
    // MARK: - Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        navigationItem.backButtonTitle = ""
        navigationItem.title = "Название события"
        dataSource = self
        headerView.delegate = self
        
        setPage(at: CNGDetailedEventPageIndex.main)
        
        pageViewController.accessibilityHint = "Название события"
    }
    
    // MARK: - Make View
    
    private func setup() {
        addSubviews()
        //setupGestures()
        moreButton.menu = UIMenu(title: "", children: [
            UIAction(title: "Demo", image: UIImage(systemName: "play.display")) { action in
                print("11")
            }, UIAction(title: "Cancel") { action in
                print("11")
            }, UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { action in
                print("11")
            }])
    }
    
    private func addSubviews() {
        navigationItem.rightBarButtonItems = [moreButton, actionButton]
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
        case moreButton:
            print("moreButton")
        default: fatalError("Target not set up properly")
        }
    }
    
    // MARK: - CKPageViewControllerDataSource
    
    public func pageViewController(_ pageViewController: CKPageViewController, prepare viewController: CKIndexable, for index: CKAnyIndex) {
    }
    
    public func pageViewController(_ pageViewController: CKPageViewController, viewControllerAt index: CKAnyIndex) -> CKIndexable {
        guard let viewController = coordinator?.makeEventViewController(for: index) as? CKIndexable else {
            fatalError()
        }
        return viewController
    }
    
    public func pageViewController(_ pageViewController: CKPageViewController, didSelectViewController viewController: CKIndexable) {
        guard let pageIndex = viewController.index as? CNGDetailedEventPageIndex, let index = CNGDetailedEventPageIndex.allCases.firstIndex(of: pageIndex) else { return }
        headerView.segmentedControl.selectedSegmentIndex = index
    }
    
    // MARK: - CNGSegmentedControlViewDelegate
    
    public func headerView(_ headerView: CNGSegmentedControlView, didSelect value: Int) {
        var direction: UIPageViewController.NavigationDirection = .forward
        if let index = selectedIndex as? CNGDetailedEventPageIndex, let oldValue = CNGDetailedEventPageIndex.allCases.firstIndex(of: index), oldValue > value {
            direction = .reverse
        }
        setPage(at: CNGDetailedEventPageIndex.allCases[value], direction: direction, animated: true)
    }
    
}
