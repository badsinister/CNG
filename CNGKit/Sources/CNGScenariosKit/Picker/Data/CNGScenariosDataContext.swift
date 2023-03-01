/**
 
 Сценарии. Контекст данных для передачи данных.
 
 */

import Foundation
import CoreKitUI
import StoreKit

struct CNGScenariosDataContext: CKAnyDataContext {

    var model: [DSDataCollection<DSScenario>]
    
    init(model: [DSScenario]?) {
        guard let scenarios = model, !scenarios.isEmpty else {
            self.model = []
            return
        }
        let groupedScenarios = Dictionary(grouping: scenarios) { $0.group }
        var groupedModel = [DSDataCollection<DSScenario>]()
        for (group, items) in groupedScenarios {
            let collection = DSDataCollection<DSScenario>(items: items.sorted(by: { $0.name > $1.name }), title: group)
            groupedModel.append(collection)
        }
        self.model = groupedModel.sorted(by: { $0.title ?? $0.id > $1.title ?? $1.id })
    }
}
