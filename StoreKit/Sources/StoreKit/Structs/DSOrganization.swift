/**
 
 Организация. Модель данных.
 
 */

import Foundation
import CoreLocation

public struct DSOrganization: Codable, Hashable, Identifiable, DSAnyOrganization {
    
    // MARK: - DSAnyOrganization
    public var id: String
    public var name: String
    public var postalAddress: DSPostalAddress?
    public var phoneNumber: String?
    public var type: DSOrganizationType
    public var isFavorited: Bool
    
    // Координата
    public var coordinate: CLLocationCoordinate2D?
    
    // MARK: - Hashable

    public static func == (lhs: DSOrganization, rhs: DSOrganization) -> Bool {
        lhs.id == rhs.id &&
        lhs.name == rhs.name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }
}

extension CLLocationCoordinate2D: Codable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        try container.encode(longitude)
        try container.encode(latitude)
    }
    
    public init(from decoder: Decoder) throws {
        self.init()
        var container = try decoder.unkeyedContainer()
        longitude = try container.decode(Double.self)
        latitude = try container.decode(Double.self)
    }
}
