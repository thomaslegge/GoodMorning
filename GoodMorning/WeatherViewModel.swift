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
    @Published var weatherSecondary: String?
    @Published var weatherBringJacket: String?
    @Published var weatherIconName: String?
    @Published var weatherDescStylised: String?
    
    init() {
        let result = WebService()
        result.getWeatherData { result in
            switch result {
            case .failure(let error):
                print("WeatherViewModel Error: ", error)
            case .success(let weather):
                self.weatherPublished = weather
                
                if self.weatherPublished != nil {
                    switch self.weatherPublished!.weather![0].id! {
                    case 200...299:
                        //print("Thunderstorms")
                        self.weatherBringJacket = "Avoid the lightning"
                        self.weatherIconName = "cloud.bolt.rain.fill"
                    case 300...399:
                        //print("Drizzle")
                        self.weatherBringJacket = "Bring a light jacket"
                        self.weatherIconName = "cloud.drizzle.fill"
                    case 500...599:
                        //print("Rain")
                        self.weatherBringJacket = "Bring a raincoat"
                        self.weatherIconName = "cloud.rain.fill"
                    case 600...699:
                        //print("Snow")
                        self.weatherBringJacket = "Bring a snow jacket!"
                        self.weatherIconName = "cloud.snow.fill"
                    case 700...799:
                        //print("Atmosphere")
                        self.weatherBringJacket = "Exercise Caution"
                        self.weatherIconName = "tornado"
                    case 800:
                        //print("Clear")
                        self.weatherBringJacket = "Enjoy the weather!"
                        self.weatherIconName = "sun.max.fill"
                    case 801...809:
                        //print("Clouds")
                        self.weatherBringJacket = "Bring a light jacket"
                        self.weatherIconName = "cloud.fill"
                    default:
                        //print("Default")
                        self.weatherBringJacket = "Enjoy the weather!"
                        self.weatherIconName = "sun.max.fill"
                    }
                    self.weatherSecondary = "Humidity: \(String(self.weatherPublished!.main!.humidity!))%"
                    self.weatherDescStylised = self.weatherPublished!.weather![0].weatherDescription!.capitalizingFirstLetter()
                } else {
                    print("nil weather")
                }
            }
        }
        
//        weatherPublished = WeatherData(
//            coord: Coord(lon: 4,lat: 6),
//            weather: [Weather(id: 700, main: "DEBUG", weatherDescription: "DEBUG", icon: "DEBUG")],
//            base: "DEBUG",
//            main: Main(temp: 1.0, feelsLike: 1.0, tempMin: 1.0, tempMax: 1.0, pressure: 1, humidity: 1),
//            visibility: 1,
//            wind: Wind(speed: 1.0, deg: 1),
//            clouds: Clouds(all: 1),
//            dt: 1,
//            sys: Sys(type: 1, id: 1, message: 1.0, country: "DEBUG", sunrise: 1, sunset: 1),
//            timezone: 1,
//            id: 1,
//            name: "DEBUG",
//            cod: 1
//        )
    }
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
