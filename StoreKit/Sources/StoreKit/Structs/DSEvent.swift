/**
 
 Событие. Модель данных.
 
 */

import Foundation
import CoreLocation
import UIKit

public struct DSEvent: Codable, Hashable, Identifiable, DSAnyEvent {
    
    public var id: String
    
    // MARK: - DSAnyEvent
    public var startDate: Date
    public var endDate: Date
    public var isAllDay: Bool
    public var title: String?
    public var details: String?
    public var coordinate: CLLocationCoordinate2D?
    
    enum CodingKeys: String, CodingKey {
        case id
        case startDate
        case endDate
        case isAllDay
        case title
        case details
        case latitude
        case longitude
    }
    
    public init(startDate: Date, endDate: Date) {
        self.id = UUID().uuidString
        self.startDate = startDate
        self.endDate = endDate
        self.isAllDay = false
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(startDate, forKey: .startDate)
        try container.encode(endDate, forKey: .endDate)
        try container.encode(isAllDay, forKey: .isAllDay)
        try container.encode(title, forKey: .title)
        try container.encode(details, forKey: .details)
        try container.encode(coordinate?.latitude, forKey: .latitude)
        try container.encode(coordinate?.longitude, forKey: .longitude)
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(String.self, forKey: .id)
        startDate = try values.decode(Date.self, forKey: .startDate)
        endDate = try values.decode(Date.self, forKey: .endDate)
        isAllDay = try values.decode(Bool.self, forKey: .isAllDay)
        title = try values.decode(String.self, forKey: .title)
        details = try values.decode(String.self, forKey: .details)
        let latitude = try values.decode(Double.self, forKey: .latitude)
        let longitude = try values.decode(Double.self, forKey: .longitude)
        coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    public static func == (lhs: DSEvent, rhs: DSEvent) -> Bool {
        return lhs.id == rhs.id && lhs.startDate == rhs.startDate && lhs.endDate == rhs.endDate
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(startDate)
        hasher.combine(endDate)
    }

}
