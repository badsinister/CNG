
import UIKit
import CoreKitUI

class CNGServiceViewController: CKViewController<CNGSynchronizationDataProvider, CNGServiceViewSynchronizer> {
    
    // MARK: - Initializers
    
    init() {
        super.init(viewSynchronizer: CNGServiceViewSynchronizer(), dataProvider: CNGSynchronizationDataProvider())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Live Cycle

    override func viewDidLoad() {
        contentView.delegate = self
        super.viewDidLoad()
    }
    
}

extension CNGServiceViewController: CNGServiceViewDelegate {
    
    func serviceView(_ serviceView: CNGServiceView, willCancelSynchronization sender: Any?) {
        let alertController = UIAlertController(title: "Logout", message: "All your data will be deleted from the device. Do you really want to log out?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            
        })
        alertController.addAction(UIAlertAction(title: "Logout", style: .destructive) { _ in
            
        })
        present(alertController, animated: true)
    }
    
}
