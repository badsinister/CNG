/**
 
 События. Контекст данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

public struct CNGEventsDataContext: CKAnyDataContext {
    
    public var model: [DSDataCollection<DSEvent>]
    
    public init(model: [DSEvent]?) {
        guard let events = model, !events.isEmpty else {
            self.model = []
            return
        }
        let groupedEvents = Dictionary(grouping: events) {
            return $0.startDate
        }
        var groupedModel = [DSDataCollection<DSEvent>]()
        for (date, items) in groupedEvents {
            let collection = DSDataCollection<DSEvent>(items: items, title: DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .medium))
            groupedModel.append(collection)
        }
        groupedModel.sort()
        self.model = groupedModel
    }

}
