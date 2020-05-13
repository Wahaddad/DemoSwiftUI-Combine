//
//  UserMapView.swift
//  DemoSwiftUI
//
//  Created by Walid Haddad on 20/04/2020.
//  Copyright © 2020 ForgeTech Consulting. All rights reserved.
//

import SwiftUI
import MapKit

struct UserMapView: UIViewRepresentable {
    
    let regionRadius: CLLocationDistance = 700
    
    @State var userAnnotation: UserAnnotation
    
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.delegate = context.coordinator

        let region = MKCoordinateRegion(center: userAnnotation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        uiView.setRegion(region, animated: true)
        uiView.addAnnotation(userAnnotation)
    }
    
    func makeCoordinator() -> UserMapViewCoordinator {
        UserMapViewCoordinator(self)
    }
}

struct UserMapView_Previews: PreviewProvider {
    static var previews: some View {
        UserMapView(userAnnotation: UserAnnotation(title: userData.firstName, coordinate: userData.locationCoordinate))
    }
}
