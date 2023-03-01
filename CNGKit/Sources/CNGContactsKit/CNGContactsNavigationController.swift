/**
 
 Базовый навигационный контроллер Контактов.
 
 */
import UIKit
import StoreKit
import CoreKitUI
import CNGKitUI
import CNGShedulerKit

public class CNGContactsNavigationController: CNGNavigationController<DSAnyContactsStore> {
    
    // MARK: - Initializerss
    
    public override init(store: DSAnyContactsStore) {
        super.init(store: store)
        self.viewControllers = [CNGContactsViewController(dataProvider: CNGContactsDataProvider(store: store))]
    }
    
    /// Отображение контроллера в окне поверх основного вида.
    /// - Parameters:
    ///   - viewController: UIViewController для отображения.
    ///   - sourceView: Вид источник события, отображающий окно; на него будет указывать стрелка.
    public func presentPopover(_ viewController: UIViewController, sourceView: UIView?) {
        viewController.modalPresentationStyle = .popover
        viewController.popoverPresentationController?.sourceView = sourceView
        topViewController?.present(viewController, animated: true)
    }
    
    /// Отображение окна Таргет.
    /// - Parameters:
    ///   - sourceView: Вид, вызывающий окно; кнопка Таргет.
    ///   - delegate: Получатель событий от окна Таргет.
    public func showTargetViewController(sourceView: UIView?, delegate: CNGTargetPickerViewControllerDelegate?) {
        let viewController = CNGTargetPickerViewController(delegate: delegate)
        presentPopover(viewController, sourceView: sourceView)
    }
    
    /// Отображение окна Специальность.
    /// - Parameters:
    ///   - sourceView: Вид, вызывающий окно; кнопка Специальность.
    ///   - delegate: Получатель событий от окна Специальность.
    public func showSpecialtyViewController(sourceView: UIView?, delegate: CNGSpecialtyPickerViewControllerDelegate?) {
        (store as! DSStore).fetchSpecialties { result in
            switch result {
            case .success(let specialties):
                let viewController = CNGSpecialtyPickerViewController(items: specialties, delegate: delegate)
                self.presentPopover(viewController, sourceView: sourceView)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    /// Отображение окна Тип организации.
    /// - Parameters:
    ///   - sourceView: Вид, вызывающий окно; кнопка Тип организации.
    ///   - delegate: Получатель событий от окна Тип организации.
    public func showOrganizationTypeViewController(sourceView: UIView?, delegate: CNGOrganizationTypePickerViewControllerDelegate?) {
        (store as! DSStore).fetchOrganizationTypes { result in
            switch result {
            case .success(let organizationTypes):
                let viewController = CNGOrganizationTypePickerViewController(items: organizationTypes, delegate: delegate)
                self.presentPopover(viewController, sourceView: sourceView)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    public func showCreateEventViewController(sender: UIBarButtonItem) {
        let navigationController = CNGNavigationController(store: store)
        navigationController.viewControllers = [UIViewController()]
        navigationController.modalPresentationStyle = .popover
        if #available(iOS 16.0, *) {
            navigationController.popoverPresentationController?.sourceItem = sender
        } else {
            navigationController.popoverPresentationController?.barButtonItem = sender
        }
        present(navigationController, animated: true)
    }
    
    /// Создание Отображения для карусели видов.
    /// - Parameter pageIndex: Позиция UIViewController в карусели видов.
    /// - Returns: UIViewController для отображения в карусели видов.
    public func makeViewController(for pageIndex: CKAnyIndex) -> UIViewController {
        guard let pageIndex = pageIndex as? CNGDetailedContactPageIndex else {
            fatalError("Unexpected type")
        }
        var viewController: UIViewController
        switch pageIndex {
        case .main:
            viewController = CNGContactViewController(dataProvider: CNGContactDataProvider(contactID: "", store: store as! DSStore), index: CNGDetailedContactPageIndex.main)
        case .events:
            viewController = CNGEventsViewController(store: store as! DSStore, index: CNGDetailedContactPageIndex.events)
        }
        return viewController
    }
    
    func show(_ contactPosition: DSContactPosition) {
        let viewController = CNGDetailedContactViewController(contactID: "")
        pushViewController(viewController, animated: true)
    }

}
