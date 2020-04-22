//
//  WeatherDetailView.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import SwiftUI

struct WeatherDetailView: View {
    
    @ObservedObject var weather = WeatherViewModel()
    
    var body: some View {
        Text(weather.weatherPublished?.name ?? "Hello")
            .foregroundColor(.gray)
    }
}

struct WeatherDetailView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetailView()
    }
}
