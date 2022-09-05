//
//  Store.swift
//  WeatherApp
//
//  Created by Ezequiel Rasgido on 04/09/2022.
//

import Foundation

class Store: ObservableObject {
    @Published var weatherList: [WeatherViewModel] = [WeatherViewModel]()
    
    func addWeather(
        _ weather: WeatherViewModel
    ) {
        weatherList.append(weather)
    }
}
