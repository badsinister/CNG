
import UIKit
import StoreKit
import CoreKitUI
import Combine

public class CNGEventsViewController: CKViewController<CNGEventsDataProvider, CNGEventsViewSynchronizer>, CKIndexable {

    public var index: CKAnyIndex
    
    fileprivate var coordinator: CNGShedulerNavigationController? {
        return navigationController as? CNGShedulerNavigationController
    }

    private var cancellables: Set<AnyCancellable> = []
    
    public init(store: DSAnyEventsStore, index: CKAnyIndex) {
        self.index = index
        super.init(viewSynchronizer: CNGEventsViewSynchronizer(), dataProvider: CNGEventsDataProvider(store: store))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        contentView.delegate = self
        startObservingDataContext()
    }
        
    private func startObservingDataContext() {
        dataProvider.$events.sink { [weak self] in
            dump($0)
            dump(self!.dataProvider.events)
            let context = CNGEventsDataContext(model: $0 as? [DSEvent])
            self?.updateView(with: context)
        }.store(in: &cancellables)
    }
    
}

// MARK: - CNGEventsView Delegate

extension CNGEventsViewController: CNGEventsViewDelegate {

    public func eventsView(_ eventsView: CNGEventsView, didSelectEventAt indexPath: IndexPath, sender: Any?) {
        guard let event = viewSynchronizer.item(for: indexPath) else { return }
        coordinator?.show(event)
    }
    
}
