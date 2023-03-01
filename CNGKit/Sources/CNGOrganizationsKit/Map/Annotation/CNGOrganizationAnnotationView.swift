
import Foundation
import ResourcesKit
import MapKit

public let CNGOrganizationClusteringIdentifier = "CNGOrganizationClusteringIdentifier"

/// Вид аннотации организации для отображения на карте.
public class CNGOrganizationAnnotationView: MKMarkerAnnotationView {

    static var identifier = "CNGOrganizationAnnotationViewIdentifier"

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.clusteringIdentifier = CNGOrganizationClusteringIdentifier
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func prepareForDisplay() {
        super.prepareForDisplay()
        animatesWhenAdded = true
        canShowCallout = true
        markerTintColor = RKPalette.secondaryRed.color
        glyphImage = UIImage(systemName: "cross.fill")
        
        let iconView = RKEventIconView(style: .organization)
        iconView.frame = CGRect(origin: .zero, size: CGSize(width: 35.0, height: 35.0))
        leftCalloutAccessoryView = iconView
    }

}
