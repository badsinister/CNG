/**
 
 Управление переключениями между секциями.
 
 */

import Foundation
import UIKit

import CNGShedulerKit
import CNGScenariosKit
import CNGContactsKit
import CNGOrganizationsKit
import CNGLibraryKit
import CNGSynchronizationKit

import StoreKit

/// Протокол уведомления о выборе раздела.
protocol SectionsManagerDelegate: AnyObject {
    
    /// Уведомление о выбранном разделе.
    /// - Parameters:
    ///   - manager: Менеджер, информирующий о выборе.
    ///   - index: Индекс выбранного раздела.
    func sectionsManager(_ manager: SectionsManager, didSelectSectionAt index: Int)
    
}

class SectionsManager {
    
    weak var delegate: SectionsManagerDelegate?
    
    /// Разделы, доступные для отображения приложением.
    enum Section {
        case sheduler
        case contacts
        case organizations
        case scenarios
        case library
        case synchronization
        
        /// Иконка для меню
        var icon: UIImage {
            let configuration = UIImage.SymbolConfiguration(weight: .thin)
            let image: UIImage?
            switch self {
            case .sheduler: image = UIImage(systemName: "clock", withConfiguration: configuration)!
            case .contacts: image = UIImage(systemName: "person.crop.square", withConfiguration: configuration)!
            case .organizations: image = UIImage(systemName: "building.2", withConfiguration: configuration)!
            case .scenarios: image = UIImage(systemName: "arrowtriangle.forward.square", withConfiguration: configuration)!
            case .library: image = UIImage(systemName: "folder", withConfiguration: configuration)!
            case .synchronization: image = UIImage(systemName: "arrow.triangle.2.circlepath", withConfiguration: configuration)!
            }
            return image ?? UIImage()
        }
        
        /// Заголовок страницы раздела
        var title: String {
            switch self {
            case .sheduler: return "Calendar".capitalized
            case .contacts: return "Contacts".capitalized
            case .organizations: return "Organizations".capitalized
            case .scenarios: return "Scenarios".capitalized
            case .library: return "Library".capitalized
            case .synchronization: return "Synchronization".capitalized
            }
        }
        
        /// Основной контроллер раздела
        var controller: UIViewController {
            switch self {
            case .sheduler: return CNGShedulerNavigationController(store: DSStore(name: "Contacts"))
            case .contacts: return CNGContactsNavigationController(store: DSStore(name: "Contacts"))
            case .organizations: return CNGOrganizationsNavigationController(store: DSStore(name: "Organizations"))
            case .scenarios: return CNGScenariosNavigationController(store: DSStore(name: "Organizations"))
            case .library: return CNGLibraryNavigationController(store: DSStore(name: ""))
            case .synchronization: return CNGSynchronizationNavigationController(store: DSStore(name: ""))
            }
        }
    }
    
    /// Набор разделов для отображения. Формируется методом `reloadData`.
    var sections: [Section] = []
    
    /// Индекс текущего выбранного раздела.
    var selectedIndex: Int = 0
    
    /// Текущий выбранный раздел с индексом `selectedIndex`. Nil в случае некорректного индекса.
    var selectedSection: Section? {
        guard (0 ..< sections.count).contains(selectedIndex) else { return nil }
        return sections[selectedIndex]
    }
    
    init() {
        reloadData()
    }
    
    func reloadData() {
        sections = [.sheduler, .scenarios, .contacts, .organizations, .library, .synchronization]
    }
    
    func selectSection(at index: Int) {
        selectedIndex = index
        delegate?.sectionsManager(self, didSelectSectionAt: index)
    }

    func makeControllers() -> [UIViewController] {
        var controllers = [UIViewController]()
        sections.forEach {
            controllers.append($0.controller)
        }
        return controllers
    }

}
