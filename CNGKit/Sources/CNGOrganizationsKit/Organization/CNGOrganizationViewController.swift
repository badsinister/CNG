
import UIKit
import StoreKit
import CoreKitUI
import CNGKitUI
import Combine

class CNGOrganizationViewController: CKViewController<CNGOrganizationDataProvider, CNGOrganizationViewSynchronizer>, CKIndexable {

    var index: CKAnyIndex
    
    private var cancellables: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    
    public init(dataProvider: CNGOrganizationDataProvider, index: CNGDetailedOrganizationPageIndex) {
        self.index = index
        super.init(viewSynchronizer: CNGOrganizationViewSynchronizer(), dataProvider: dataProvider)
    }

    // MARK: - Initializers
    
    public init(organization: DSOrganization, store: DSAnyOrganizationsStore, index: CNGDetailedOrganizationPageIndex) {
        self.index = index
        super.init(viewSynchronizer: CNGOrganizationViewSynchronizer(), dataProvider: CNGOrganizationDataProvider(with: organization, store: store))
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startObservingDataContext()
    }

    private func startObservingDataContext() {
        dataProvider.$organization.sink { [weak self] in
            dump($0)
            dump(self!.dataProvider.organization)
            guard let organization = $0 as? DSOrganization else {
                return
            }
            let context = CNGDataContext<DSOrganization>(organization)
            self?.updateView(with: context)
        }.store(in: &cancellables)
    }

}
