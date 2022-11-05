//
//  WeatherAPI.swift
//  Dharin_Weather
//
//  Created by Dharin Shah on 19/05/22.
//

import Foundation
import CoreLocation

class WeatherAPI
{
    private static let API_URL = "http://api.weatherapi.com/v1/current.json"
    private static let API_TOKEN = "417a312333f44628a0c160432221905"
    
    public static func getWeatherFor(lat: CLLocationDegrees, lng: CLLocationDegrees, completion: @escaping (WeatherApiResponse) -> Void)
    {
        let url = URL(string: "\(API_URL)?key=\(API_TOKEN)&q=\(lat),\(lng)")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with getting weather: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      print("Error with the response, unexpected status code: \(response)")
                      return
                  }

            if let jsonData = data {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(WeatherApiResponse.self, from: jsonData)
                    completion(response)
                } catch {
                    
                }
            }
            
        })
        task.resume()
    }

}
