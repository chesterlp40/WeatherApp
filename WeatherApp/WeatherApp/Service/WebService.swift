//
//  WebService.swift
//  WeatherApp
//
//  Created by Ezequiel Rasgido on 04/09/2022.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
}

class Webservice {
    func getWeatherByCity(
        city: String,
        completion: @escaping ((Result<Weather, NetworkError>) -> Void)
    ) {
        guard let weatherURL = Constants.Urls.weatherByCity(city: city) else {
            return completion(.failure(.badURL))
        }
        URLSession.shared.dataTask(with: weatherURL) { (data, _, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            let weatherResponse = try? JSONDecoder().decode(
                WeatherResponse.self,
                from: data
            )
            if let weatherResponse = weatherResponse {
                completion(.success(weatherResponse.weather))
            }
        }.resume()
    }
}