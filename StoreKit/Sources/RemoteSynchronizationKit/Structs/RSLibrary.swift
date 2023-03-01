
import Foundation

let RSLibraryDirectoriesKey = "library_directories"

struct RSLibraryDirectory: Codable {
    var id: Int
    var deleted: Bool
    var name: String
    var path: String
    var parent_id: Int?
}

let RSLibraryFilesKey = "library_files"

struct RSLibraryFile: Codable {
    var id: Int
    var deleted: Bool
    var name: String
    var path: String
    var parent_id: Int?

    var file_url: String
    var file_size: Double
    var file_updated_at: TimeInterval
}
