//
//  weatherVariables.swift
//  Dharin_Weather
//
//  Created by Dharin Shah on 20/05/22.
//

import Foundation
import UIKit

struct Failure: Decodable{
    let reason : String
}

struct weather: Codable{
    let cityCountry : String
    let temperature : Float
    let feelsLike : Float
    let windSpeed : Float
    let windDIR : String
    let humidity : Int
    let uvIndex: Float
    let visibility: Float
    
    
    enum weatherKeys: String, CodingKey{
        typealias RawValue = <#type#>
        
        case cityCountry : ""
        case temperature : ""
        case feelsLike : ""
        case windSpeed : ""
        case windDIR : ""
        case humidity : ""
        case uvIndex: ""
        case visibility: ""
    }
}
