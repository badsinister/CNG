
import UIKit
import CoreKitUI
import CNGKitUI
import StoreKit
import Combine

class CNGPresentationsViewController: CKViewController<CNGLibraryDataProvider, CNGPresentationsViewSynchronizer>, CNGPresentationsViewDelegate {
    
    private var cancellables: Set<AnyCancellable> = []
    
    init(store: DSAnyLibraryStore) {
        super.init(viewSynchronizer: CNGPresentationsViewSynchronizer(), dataProvider: CNGLibraryDataProvider(store: store))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        contentView.delegate = self
        startObservingDataContext()
        dataProvider.fetchPresentations()
    }
    
    private func startObservingDataContext() {
        dataProvider.$presentations.sink { [weak self] in
            dump($0)
            dump(self!.dataProvider.presentations)
            if let model = $0 as? [DSPresentation] {
                self?.updateView(with: CNGDataContext(model))
            }
        }.store(in: &cancellables)
    }
    
    // MARK: - ContentView CNGPresentationsViewDelegate
    
    func presentationsView(_ presentationsView: CNGPresentationsView, didSelectPresentationAt indexPath: IndexPath, sender: Any?) {
        guard let presentation = viewSynchronizer.item(for: indexPath) else { return }
        print(presentation)
    }
    
}
