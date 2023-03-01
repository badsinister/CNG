
import UIKit
import Combine
import StoreKit
import CoreKitUI

class CNGResultViewController: CKViewController<CNGEventDataProvider, CNGResultViewSynchronizer>, CKIndexable {
    
    var index: CKAnyIndex
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    
    public init(dataProvider: CNGEventDataProvider, index: CNGDetailedEventPageIndex) {
        self.index = index
        super.init(viewSynchronizer: CNGResultViewSynchronizer(), dataProvider: dataProvider)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        navigationItem.title = dataProvider.title
        startObservingDataContext()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataProvider.fetchData()
    }
    
    private func startObservingDataContext() {
        dataProvider.$event.sink { [weak self] in
            dump($0)
            dump(self!.dataProvider.event)
            guard let event = $0 as? DSEvent else {
                return
            }
            let context = CNGEventDataContext(model: event)
            self?.updateView(with: context)
        }.store(in: &cancellables)
    }
    
}
