//
//  View+Extension.swift
//  WeatherApp
//
//  Created by Ezequiel Rasgido on 04/09/2022.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        return NavigationView { self }
    }
}
