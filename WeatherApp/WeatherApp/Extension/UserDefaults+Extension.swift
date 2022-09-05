//
//  UserDefaults+Extension.swift
//  WeatherApp
//
//  Created by Ezequiel Rasgido on 04/09/2022.
//

import Foundation

extension UserDefaults {
    var unit: TemperatureUnit {
        guard let value = self.value(
            forKey: "unit"
        ) as? String else {
            return .kelvin
        }
        return TemperatureUnit(
            rawValue: value
        ) ?? .kelvin
    }
}
