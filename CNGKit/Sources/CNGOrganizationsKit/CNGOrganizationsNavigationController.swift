/**
 
 Базовый навигационный контроллер Организаций.
 
 */
import UIKit
import StoreKit
import CoreKitUI
import CNGKitUI

/// Корневой контроллер раздела Организации.
/// Отображает стек контроллеров просмотра списка организаций `CNGOrganizationsViewController`
/// и просмотра информации об организации `CNGDetailedOrganizationViewController`
public class CNGOrganizationsNavigationController: CNGNavigationController<DSAnyOrganizationsStore> {
    
    public override init(store: DSAnyOrganizationsStore) {
        super.init(store: store)
        self.viewControllers = [CNGOrganizationsViewController(store: store)]
    }
    
    public func show(_ organization: DSOrganization) {
        pushViewController(CNGDetailedOrganizationViewController(organization: organization, store: store), animated: true)
    }
    
}
