/**
 
 Контакт. Контекст данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

struct CNGOrganizationsDataContext: CKAnyDataContext {
    
    var model: [DSDataCollection<DSOrganization>]
    
    init(model: [DSOrganization]?) {
        guard let organizations = model, !organizations.isEmpty else {
            self.model = []
            return
        }
        let groupedOrganizations = Dictionary(grouping: organizations) {
            return String($0.name.uppercased().prefix(1))
        }
        var groupedModel = [DSDataCollection<DSOrganization>]()
        for (group, items) in groupedOrganizations {
            let collection = DSDataCollection<DSOrganization>(items: items, title: group)
            groupedModel.append(collection)
        }
        groupedModel.sort()
        self.model = groupedModel
    }

}
