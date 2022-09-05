//
//  Constants.swift
//  WeatherApp
//
//  Created by Ezequiel Rasgido on 04/09/2022.
//

import Foundation

struct Constants {
    static let appId = "YOUR APP ID"
    
    struct Urls {
        static func weatherByCity(
            city: String
        ) -> URL? {
            return URL(
                string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=\(appId)"
            )
        }
        
        static func weatherUrlAsStringByIcon(
            icon: String
        ) -> String {
            return "https://openweathermap.org/img/w/\(icon).png"
        }
    }
}
