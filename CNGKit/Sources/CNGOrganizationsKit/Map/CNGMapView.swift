/**
 
 Организация. Карта.
 
 */

import UIKit
import CoreKitUI
import ResourcesKit
import MapKit

/// Протокол поддержки событий вида.
public protocol CNGMapViewDelegate: AnyObject {
    
    func mapView(_ mapView: CNGMapView, willChangeFavorite sender: Any?)
    
}

/// ```
///     +---------------------------------------------+
///     |                                             |
///     |                                             |
///     |                 [ MapView ]                 |
///     |                                             |
///     |                                             |
///     +---------------------------------------------+
/// ```
public class CNGMapView: CKView {
    
    weak var delegate: CNGMapViewDelegate?
    
    var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.register(CNGOrganizationAnnotationView.self, forAnnotationViewWithReuseIdentifier: CNGOrganizationAnnotationView.identifier)
        return mapView
    }()
        
    // MARK: - Make View
    
    public override func setup() {
        super.setup()
        addSubviews()
        constrainSubviews()
        setupGestures()
    }
    
    private func addSubviews() {
        addSubview(mapView)
    }
    
    private func constrainSubviews() {
        [mapView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate(mapView.constraints(equalTo: self))
    }
    
    private func setupGestures() {
        mapView.delegate = self
    }

}

extension CNGMapView: MKMapViewDelegate {

    public func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return mapView.dequeueReusableAnnotationView(withIdentifier: CNGOrganizationAnnotationView.identifier, for: annotation)
    }

}
