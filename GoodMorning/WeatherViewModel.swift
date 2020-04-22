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
        let result = WebService()
        result.getWeatherData { result in
            switch result {
            case .failure(let error):
                print("WeatherViewModel Error: ", error)
            case .success(let weather):
                self.weatherPublished = weather
            }
        }
    }
}
