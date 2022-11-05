//
//  ViewController.swift
//  Dharin_Weather
//
//  Created by Dharin Shah on 19/05/22.
//
import Foundation
import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    
    @IBOutlet weak var cityCountryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var uvIndexLabel: UILabel!
    @IBOutlet weak var visibilityLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    
    var locationManager:CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("view loaded")
        //initializing location manager
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        
        
        //asking for permission for location
        self.locationManager.requestWhenInUseAuthorization()
        print("location requested")
        self.locationManager.startUpdatingLocation()
        
    }
    
    func weatherUpdated(data: WeatherApiResponse) {
        // Main thread for UI
        DispatchQueue.main.async {
            self.cityCountryLabel.text = ("\(data.locationData.city),  \(data.locationData.country)")
            
            self.temperatureLabel.text = "\(data.weatherData.temperature)°C"
            self.feelsLikeLabel.text = "\(data.weatherData.feelsLike)°C"
            self.windLabel.text = "\(data.weatherData.windSpeed)"
            self.windDirectionLabel.text = "\(data.weatherData.windDirection)"
            self.uvIndexLabel.text = "\(data.weatherData.uvIndex)"
            self.humidityLabel.text = "\(data.weatherData.humidity)"
            self.visibilityLabel.text = "\(data.weatherData.visibility) km"
            
            self.conditionLabel.text = "\(data.weatherData.condition.text)"
        }
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Received locations")
        
        if let lastKnownLocation = locations.first{
            let lat = lastKnownLocation.coordinate.latitude
            let lng = lastKnownLocation.coordinate.longitude
            print("Current location is : \(lat), \(lng)")
            
            WeatherAPI.getWeatherFor(lat: lat, lng: lng, completion: weatherUpdated(data:))
            
        }
        
    }
    
    
}

