
import UIKit
import Combine
import StoreKit
import CoreKitUI

class CNGContactViewController: CKViewController<CNGContactDataProvider, CNGContactViewSynchronizer>, CKIndexable {

    var index: CKAnyIndex

    private var cancellables: Set<AnyCancellable> = []

    // MARK: - Initializers
    
    public init(dataProvider: CNGContactDataProvider, index: CNGDetailedContactPageIndex) {
        self.index = index
        super.init(viewSynchronizer: CNGContactViewSynchronizer(), dataProvider: dataProvider)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonTitle = ""
        navigationItem.title = "Фамилия Имя Отчество"
        startObservingDataContext()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataProvider.fetchData()
    }

    private func startObservingDataContext() {
        dataProvider.$contact.sink { [weak self] in
            dump($0)
            dump(self!.dataProvider.contact)
            guard let contact = $0 as? DSContact else {
                return
            }
            let context = CNGContactDataContext(model: contact)
            self?.updateView(with: context)
        }.store(in: &cancellables)
    }

}
