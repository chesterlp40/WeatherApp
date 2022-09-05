//
//  ScreenSettings.swift
//  WeatherApp
//
//  Created by Ezequiel Rasgido on 04/09/2022.
//

import SwiftUI

enum TemperatureUnit: String, CaseIterable, Identifiable {
    var id: String {
        return rawValue
    }
    
    case celsius
    case fahrenheit
    case kelvin
}

extension TemperatureUnit {
    var displayText: String {
        switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            case .kelvin:
                return "Kelvin"
        }
    }
    
}

struct ScreenSettings: View {
    @EnvironmentObject var store: Store
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @AppStorage("unit") private var selectedUnit: TemperatureUnit = .kelvin
    
    var body: some View {
        VStack {
            Picker(selection: $selectedUnit, label: Text("Select temperature unit?")) {
                ForEach(TemperatureUnit.allCases, id: \.self) {
                    Text("\($0.displayText)" as String)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
    
            Spacer()
        }
        .padding()
        .navigationTitle("Settings")
        .navigationBarItems(trailing: Button("Done") {
            self.mode.wrappedValue.dismiss()
            self.store.selectedUnit = selectedUnit
        })
        .embedInNavigationView()
    }
}

struct ScreenSettings_Previews: PreviewProvider {
    static var previews: some View {
        ScreenSettings()
    }
}
