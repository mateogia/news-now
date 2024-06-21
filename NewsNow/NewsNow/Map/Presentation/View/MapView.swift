//
//  MapView.swift
//  NewsNow
//
//  Created by Mateo Giarrocco on 20/06/2024.
//

import Foundation
import SwiftUI
import UIKit
import GoogleMaps

struct MapView: UIViewRepresentable {
   
    private let zoom: Float = 10.0
    
    let user: User
   
    func makeUIView(context: Self.Context) -> GMSMapView {
       
        guard let lat = Double(user.address.geo.lat), let long = Double(user.address.geo.lat) else { return GMSMapView() }
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: zoom)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.camera = camera
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
        marker.title = "\(user.firstname) \(user.lastname)"
        marker.snippet = user.address.street
        marker.map = mapView
        return mapView
    }
    
    func updateUIView(_ mapView: GMSMapView, context: Context) {
    }
    
}
