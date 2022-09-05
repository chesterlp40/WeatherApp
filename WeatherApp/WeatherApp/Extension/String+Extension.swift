//
//  String+Extension.swift
//  WeatherApp
//
//  Created by Ezequiel Rasgido on 04/09/2022.
//

import Foundation

extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(
            withAllowedCharacters: .urlHostAllowed
        ) ?? self
    }
}
