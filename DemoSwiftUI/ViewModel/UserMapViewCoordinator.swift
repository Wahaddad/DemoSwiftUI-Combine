//
//  UserMapViewCoordinator.swift
//  DemoSwiftUI
//
//  Created by Walid Haddad on 20/04/2020.
//  Copyright © 2020 ForgeTech Consulting. All rights reserved.
//

import Foundation
import MapKit
import CoreLocation

class UserMapViewCoordinator: NSObject, MKMapViewDelegate {

    var mapViewController: UserMapView
        
    init(_ control: UserMapView) {
        self.mapViewController = control
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
        annotationView.canShowCallout = true
        annotationView.image = UIImage(named: "home-location-pin")
        return annotationView
    }
}
