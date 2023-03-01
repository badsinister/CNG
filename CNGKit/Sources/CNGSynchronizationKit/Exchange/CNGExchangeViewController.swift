
import UIKit
import CoreKitUI
import Combine

class CNGExchangeViewController: CKViewController<CNGSynchronizationDataProvider, CNGExchangeViewSynchronizer> {
    
    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Initializers
    
    init() {
        super.init(viewSynchronizer: CNGExchangeViewSynchronizer(), dataProvider: CNGSynchronizationDataProvider())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
        startObservingDataContext()
    }

    // MARK: - Observing DataContext
    
    private func startObservingDataContext() {
        //dataProvider.$synchronizationDate.sink { [weak self] in
        //    dump($0)
        //    let context = CNGSynchronizationDataContext()
        //    self?.updateView(with: context)
        //}.store(in: &cancellables)
    }

}

extension CNGExchangeViewController: CNGExchangeViewDelegate {
    
    func exchangeView(_ exchangeView: CNGExchangeView, willCancelExchange sender: Any?) {
        dismiss(animated: true)
    }
    
}
