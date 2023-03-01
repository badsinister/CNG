
import Foundation
import StoreKit
import MapKit

/// Аннотация организации для отображения на карте.
public class CNGOrganizationAnnotation: NSObject, MKAnnotation {

    private let organization: DSOrganization
    
    public var coordinate: CLLocationCoordinate2D
    
    public var title: String? {
        return organization.name
    }

    public var subtitle: String? {
        return organization.postalAddress?.street
    }

    public init(organization: DSOrganization, coordinate: CLLocationCoordinate2D) {
        self.organization = organization
        self.coordinate = coordinate
    }
    
}
