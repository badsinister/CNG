
import UIKit
import StoreKit
import CoreKitUI
import CNGKitUI
import Combine

public class CNGCreateEventViewController: CKViewController<CNGCreateEventDataProvider, CNGCreateEventViewSynchronizer> {
    
    private var cancellables: Set<AnyCancellable> = []
    
    public init(store: DSAnyEventsStore) {
        super.init(viewSynchronizer: CNGCreateEventViewSynchronizer(), dataProvider: CNGCreateEventDataProvider(store: store))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        //contentView.delegate = self
        startObservingDataContext()
    }
    
    private func startObservingDataContext() {
        dataProvider.$eventTypes.sink { [weak self] in
            dump($0)
            dump(self!.dataProvider.eventTypes)
            self?.updateView(with: CNGDataContext($0))
        }.store(in: &cancellables)
    }
    
}
