//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Ezequiel Rasgido on 04/09/2022.
//

import Foundation

struct WeatherViewModel {
    let id = UUID()
    let weather: Weather
    
    var temperature: Double {
        return weather.temperature
    }
    
    var city: String {
        return weather.city
    }
    
    var icon: String {
        return weather.icon
    }
    
    var sunrise: Date {
        return weather.sunrise
    }
    
    var sunset: Date {
        return weather.sunset
    }
    
    func getTemperatureByUnit(
        unit: TemperatureUnit
    ) -> Double {
        switch unit {
            case .kelvin:
                return weather.temperature
            case .celsius:
                return weather.temperature - 273.15
            case .fahrenheit:
                return 1.8 * (weather.temperature - 273) + 32
        }
    }
}
