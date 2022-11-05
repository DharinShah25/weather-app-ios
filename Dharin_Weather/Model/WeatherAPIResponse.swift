//
//  weatherStructure.swift
//  Dharin_Weather
//
//  Created by Dharin Shah on 21/05/22.
//

import Foundation

struct Condition:Codable {
    let text: String
    
    enum conditionKeys: String, CodingKey {
        case text
    }
    
    init(from decoder: Decoder) throws {
        let conditionContainer = try decoder.container(keyedBy: conditionKeys.self)
        
        self.text = try conditionContainer.decodeIfPresent(String.self, forKey: .text) ?? "Condition not found"

    }
}

struct Location: Codable {
    let city: String
    let country: String
    
    enum locationKeys: String, CodingKey {
        case city = "name"
        case country = "country"
    }
    
    init(from decoder: Decoder) throws {
        let locationContainer = try decoder.container(keyedBy: locationKeys.self)
        
        self.city = try locationContainer.decodeIfPresent(String.self, forKey: .city) ?? "City not found"
        self.country = try locationContainer.decodeIfPresent(String.self, forKey: .country) ?? "Country not found"
        
    }
}

struct Weather: Codable
{
    let temperature: Float
    let feelsLike:Float
    let windSpeed:Float
    let windDirection:String
    let humidity:Int
    let uvIndex:Float
    let visibility:Float
    let condition: Condition
    
    enum weatherKeys:String, CodingKey {
        
        case temperature = "temp_c"
        case feelsLike = "feelslike_c"
        case windSpeed = "wind_kph"
        case windDirection = "wind_dir"
        case humidity
        case uvIndex = "uv"
        case visibility = "vis_km"
        case condition
    }
    
    init(from decoder: Decoder) throws {
        let weatherContainer = try decoder.container(keyedBy: weatherKeys.self)
        self.temperature = try weatherContainer.decodeIfPresent(Float.self, forKey: .temperature) ?? 0.0
        self.feelsLike = try weatherContainer.decodeIfPresent(Float.self, forKey: .feelsLike) ?? 0.0
        self.windSpeed = try weatherContainer.decodeIfPresent(Float.self, forKey: .windSpeed) ?? 0.0
        self.windDirection = try weatherContainer.decodeIfPresent(String.self, forKey: .windDirection) ?? "Not found"
        self.humidity = try weatherContainer.decodeIfPresent(Int.self, forKey: .humidity) ?? 00
        self.uvIndex = try weatherContainer.decodeIfPresent(Float.self, forKey: .uvIndex) ?? 0.0
        self.visibility = try weatherContainer.decodeIfPresent(Float.self, forKey: .visibility) ?? 0.0
        self.condition = try weatherContainer.decodeIfPresent(Condition.self, forKey: .condition)!
    }
}

struct WeatherApiResponse: Codable
{
    let weatherData: Weather
    let locationData: Location
    
    enum weatherApiResponseKeys: String, CodingKey {
        case weather = "current"
        case location = "location"
    }
    
    init(from decoder: Decoder) throws {
        let responseContainer = try decoder.container(keyedBy: weatherApiResponseKeys.self)
        self.weatherData = try responseContainer.decodeIfPresent(Weather.self, forKey: .weather)!
        self.locationData = try responseContainer.decodeIfPresent(Location.self, forKey: .location)!
        
    }
}
