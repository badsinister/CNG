/**
 
 Контакты. Контекст данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

typealias DataCollection = [DSDataCollection<DSContactPosition>]

struct CNGContactsDataContext: CKAnyDataContext {
    
    var model: [DSContactPosition]
    
    var groupedModel: DataCollection? = nil
    
    init(model: [DSContactPosition]?) {
        guard let contactPositions = model, !contactPositions.isEmpty else {
            self.model = []
            self.groupedModel = nil
            return
        }
        let groupedContactPositions = Dictionary(grouping: contactPositions) {
            let familyName = $0.contact.fullName.familyName ?? ""
            return String(familyName.uppercased().prefix(1))
            
        }
        var groupedModel = DataCollection()
        for (group, items) in groupedContactPositions {
            let collection = DSDataCollection<DSContactPosition>(items: items, title: group)
            groupedModel.append(collection)
        }
        self.model = contactPositions
        self.groupedModel = groupedModel
    }
    
}
