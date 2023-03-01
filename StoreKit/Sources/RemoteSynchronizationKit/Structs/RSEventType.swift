
import Foundation

let RSEventTypesKey = "event_types"

struct RSEventType: Codable {
    var id: Int
    var name: String
    var group: Int
    var position: Int
}
