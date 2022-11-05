//
//  UserLocationVC.swift
//  Dharin_Weather
//
//  Created by Dharin Shah on 19/05/22.
//
import UIKit
import CoreLocation

class UserLocationVC: UIViewController, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        //initializing location manager
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        
        //asking for permission for location
        self.locationManager.requestWhenInUseAuthorization()
    }
    
    @IBOutlet weak var btnGetLocation: UIButton!
    
    @IBAction func btnGetLocationPressed(_ sender: UIButton) {
        //request user location
        self.locationManager.startUpdatingLocation()
        print("Getting user location...")
        
        btnGetLocation.isEnabled = false
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Received locations")
    
//        if let lastKnownLocation = locations.first{
//            let lat = lastknownLocation.coordinate.latitude
//            let lng = lastKnownLocation.coordinate.longitude
//            print("Current location is : \(lat), \(lng)")
//        }
    }
}
