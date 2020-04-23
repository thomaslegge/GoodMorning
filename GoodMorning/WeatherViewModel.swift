//
//  WeatherViewModel.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weatherPublished: WeatherData? = nil
    
    init() {
        
        let DEBUG_WEATHER = true
        if DEBUG_WEATHER {
            weatherPublished = WeatherData(
                coord: Coord(lon: 4,lat: 6),
                weather: [Weather(id: 1, main: "DEBUG", weatherDescription: "DEBUG", icon: "DEBUG")],
                base: "DEBUG",
                main: Main(temp: 1.0, feelsLike: 1.0, tempMin: 1.0, tempMax: 1.0, pressure: 1, humidity: 1),
                visibility: 1,
                wind: Wind(speed: 1.0, deg: 1),
                clouds: Clouds(all: 1),
                dt: 1,
                sys: Sys(type: 1, id: 1, message: 1.0, country: "DEBUG", sunrise: 1, sunset: 1),
                timezone: 1,
                id: 1,
                name: "DEBUG",
                cod: 1
            )
            return
        }
        
//        let result = WebService()
//        result.getWeatherData { result in
//            switch result {
//            case .failure(let error):
//                print("WeatherViewModel Error: ", error)
//            case .success(let weather):
//                self.weatherPublished = weather
//            }
//        }
    }
}

