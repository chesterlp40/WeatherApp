//
//  WeatherListScreen.swift
//  WeatherApp
//
//  Created by Ezequiel Rasgido on 04/09/2022.
//

import SwiftUI

enum Sheets: Identifiable {
    
    var id: UUID {
        return UUID()
    }
    
    case addNewCity
    case settings
}

struct WeatherListScreen: View {
    @EnvironmentObject var store: Store
    @State private var activeSheet: Sheets?
    
    var body: some View {
        List {
            ForEach(store.weatherList, id: \.id) { weather in
                WeatherCell(weather: weather)
            }
        }
        .listStyle(PlainListStyle())
        .sheet(item: $activeSheet, content: { (item) in
            switch item {
                case .addNewCity:
                    AddCityScreen().environmentObject(store)
                case .settings:
                    ScreenSettings().environmentObject(store)
            }
        })
        .navigationBarItems(leading: Button(action: {
            activeSheet = .settings
        }) {
            Image(systemName: "gearshape")
        }, trailing: Button(action: {
            activeSheet = .addNewCity
        }, label: {
            Image(systemName: "plus")
        }))
        .navigationTitle("Cities")
        .embedInNavigationView()
    }
}

struct WeatherCell: View {
    @EnvironmentObject var store: Store
    let weather: WeatherViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 15) {
                Text(self.weather.city)
                    .fontWeight(.bold)
                HStack {
                    Image(systemName: "sunrise")
                    Text("\(self.weather.sunrise.formatAsString())")
                }
                HStack {
                    Image(systemName: "sunset")
                    Text("\(self.weather.sunset.formatAsString())")
                }
            }
            Spacer()
            URLImage(
                url: Constants.Urls.weatherUrlAsStringByIcon(
                    icon: weather.icon
                )
            )
                .frame(width: 50, height: 50)
            
            Text(
                "\(Int(weather.getTemperatureByUnit(unit: store.selectedUnit))) \(String(store.selectedUnit.displayText.prefix(1)))"
            )
        }
        .padding()
        .background(
            Color(
                #colorLiteral(
                    red: 0.9133135676,
                    green: 0.9335765243,
                    blue: 0.98070997,
                    alpha: 1
                )
            )
        )
        .clipShape(
            RoundedRectangle(
                cornerRadius: 10,
                style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/
            )
        )
    }
}

struct WeatherListScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherListScreen().environmentObject(Store())
    }
}
