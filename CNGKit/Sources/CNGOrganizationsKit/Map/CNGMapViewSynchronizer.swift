/**
 
 Создание и обновление вида карты организации.
 
 */

import UIKit
import CoreKitUI
import CNGKitUI
import StoreKit
import MapKit

class CNGMapViewSynchronizer: CKAnyViewSynchronizer {
    
    func makeView() -> CNGMapView {
        return CNGMapView()
    }
    
    func updateView(_ view: CNGMapView, context: CNGDataContext<DSOrganization>) {
        if let coordinate = context.model.coordinate {
            let annotation = CNGOrganizationAnnotation(organization: context.model, coordinate: coordinate)
            let region = MKCoordinateRegion(center: coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
            view.mapView.addAnnotation(annotation)
            view.mapView.setRegion(region, animated: false)
        }
    }
    
}
