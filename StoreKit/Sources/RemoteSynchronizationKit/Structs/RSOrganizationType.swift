
import Foundation

let RSOrganizationTypesKey = "organization_types"

enum RSOrganizationTypeCode: String, Codable {
    case pharmacy, hospital
}

struct RSOrganizationType: Codable {
    var id: Int
    var deleted: Bool
    var name: String
    var code: RSOrganizationTypeCode
}
