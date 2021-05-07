//
//  SearchViewController.swift
//  iTravel
//
//  Created by Paul Junver Soriano on 5/6/21.
//  Copyright © 2021 shijiah2012@gmail.com. All rights reserved.
//

import UIKit
import MapKit

protocol HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark)
}

class SearchViewController: UIViewController  {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var selectedPin:MKPlacemark? = nil
    
    var resultSearchController:UISearchController? = nil
    
    let locationManager = CLLocationManager()

    
        override func viewDidLoad() {
            super.viewDidLoad()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
            
            let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "SearchTableView") as! SearchTableViewController
            resultSearchController = UISearchController(searchResultsController: locationSearchTable)
            resultSearchController?.searchResultsUpdater = locationSearchTable
            locationSearchTable.handleMapSearchDelegate = self
            
            let searchBar = resultSearchController!.searchBar
            searchBar.sizeToFit()
            searchBar.placeholder = "Search for places"
            navigationItem.searchController = resultSearchController
            
            resultSearchController?.hidesNavigationBarDuringPresentation = false
            resultSearchController?.dimsBackgroundDuringPresentation = true
            definesPresentationContext = true
            
            locationSearchTable.mapView = mapView
        }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SearchViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
         print("error:: \(error.localizedDescription)")
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestLocation()
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

        if locations.first != nil {
            print("location:: (location)")
        }

    }

}

extension SearchViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        selectedPin = placemark
        // clear existing pins
        mapView.removeAnnotations(mapView.annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
        let state = placemark.administrativeArea {
            annotation.subtitle = "(city) (state)"
        }
        mapView.addAnnotation(annotation)
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: placemark.coordinate, span: span)
        mapView.setRegion(region, animated: true)
    }
}
