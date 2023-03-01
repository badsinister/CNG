
import UIKit
import StoreKit
import CoreKitUI
import CNGKitUI
import Combine

class CNGMapViewController: CKViewController<CNGOrganizationDataProvider, CNGMapViewSynchronizer>, CKIndexable {
    
    var index: CKAnyIndex
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    
    public init(dataProvider: CNGOrganizationDataProvider, index: CNGDetailedOrganizationPageIndex) {
        self.index = index
        super.init(viewSynchronizer: CNGMapViewSynchronizer(), dataProvider: dataProvider)
    }
    
    // MARK: - Initializers
    
    public init(organization: DSOrganization, store: DSAnyOrganizationsStore, index: CNGDetailedOrganizationPageIndex) {
        self.index = index
        super.init(viewSynchronizer: CNGMapViewSynchronizer(), dataProvider: CNGOrganizationDataProvider(with: organization, store: store))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startObservingDataContext()
        dataProvider.fetchLocation()
    }
    
    private func startObservingDataContext() {
        dataProvider.$organization.sink { [weak self] in
            dump($0)
            dump(self!.dataProvider.organization)
            guard let organization = $0 as? DSOrganization else {
                return
            }
            self?.updateView(with: CNGDataContext<DSOrganization>(organization))
        }.store(in: &cancellables)
    }

}
