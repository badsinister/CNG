
import UIKit
import CoreKitUI
import CNGKitUI
import StoreKit
import Combine

class CNGFilesViewController: CKViewController<CNGLibraryDataProvider, CNGFilesViewSynchronizer>, CNGFilesViewDelegate  {

    private var cancellables: Set<AnyCancellable> = []
    
    init(store: DSAnyLibraryStore) {
        super.init(viewSynchronizer: CNGFilesViewSynchronizer(), dataProvider: CNGLibraryDataProvider(store: store))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        contentView.delegate = self
        startObservingDataContext()
        dataProvider.fetchEntities()
    }
    
    private func startObservingDataContext() {
        dataProvider.$entities.sink { [weak self] in
            dump($0)
            dump(self!.dataProvider.entities)
            if let model = $0 as? [DSLibraryEntity] {
                self?.updateView(with: CNGDataContext(model))
            }
        }.store(in: &cancellables)
    }
    
    // MARK: - ContentView CNGFilesViewDelegate
    
    func filesView(_ libraryView: CNGFilesView, didSelectPositionAt indexPath: IndexPath) {
        guard let entity = viewSynchronizer.item(for: indexPath) else { return }
        print(entity)
    }

}
