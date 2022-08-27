//
//  MapViewController.swift
//  Square One Task
//
//  Created by Karim Soliman on 26/08/2022.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    let manger = CLLocationManager()
    var latitude: Double = 0
    var longitiude:Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        title = "Map View"
       // navigationItem.title = "Tes"
        navigationController?.navigationBar.backgroundColor = .white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupMap()
    }
    
    func setupMap() {
        manger.desiredAccuracy = kCLLocationAccuracyBest
        manger.delegate = self
        manger.requestWhenInUseAuthorization()
        manger.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            manager.stopUpdatingLocation()
            render(location, lat: 52.3676, long: 4.9041)
        }
    }
    
    func render(_ location: CLLocation, lat: Double?, long: Double?) {
        
        let coordinates = CLLocationCoordinate2D(
            latitude: lat ?? 52.3676,
            longitude: long ?? 4.9041)

        
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        mapView.setRegion(region, animated: true)
        setPinOnMap(coordinates: coordinates)
    }
    
    func setPinOnMap(coordinates: CLLocationCoordinate2D) {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        mapView.addAnnotation(pin)
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
       
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
