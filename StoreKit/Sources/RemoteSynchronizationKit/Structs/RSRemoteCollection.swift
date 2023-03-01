
import Foundation

struct RSRemoteCollection: Codable {
    var context: RSContext
    var data_files: [String]
    var presentation_files: [String]
}

struct RSContext: Codable {
    var last_pull_date: TimeInterval
    var presentation_ids: [Int]
}
