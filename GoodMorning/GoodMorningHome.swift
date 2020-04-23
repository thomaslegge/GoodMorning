//
//  GoodMorningHome.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import SwiftUI

struct GoodMorningHome: View {
    @ObservedObject var observedWeather = WeatherViewModel()
    @ObservedObject var observedNews = NewsViewModel()
    var userLoad = UserData()
    
    init() {
        let defaults = UserDefaults.standard

        if let savedUser = defaults.object(forKey: "userData") as? Data {
            let jsonDecoder = JSONDecoder()

            do {
                print("Pre Load", userLoad.name, userLoad.city, userLoad.isFirstTimeStartup)
                userLoad = try jsonDecoder.decode(UserData.self, from: savedUser)
                print("Post Load", userLoad.name, userLoad.city, userLoad.isFirstTimeStartup)
            } catch {
                print("Failed to load userData")
            }
        }
    }
    
    var body: some View {
        ZStack {
            
            Color("Background").edgesIgnoringSafeArea(.all)
            
            VStack {
                
                VStack {
                    HStack {
                        VStack {
                            HeroText(heroString: "Good Morning,", heroWidth: 330, heroHeight: 60)
                                .offset(x: -10)
                            HeroText(heroString: "Thomas", heroWidth: 330, heroHeight: 60)
                                .offset(x: -10)
                            HStack {
                                if (userLoad.city == nil) {
                                    StandardText(textString: "Today.")
                                }
                                else {
                                    StandardText(textString: "Today in \(userLoad.city!).")
                                }
                                
                                Spacer()
                            }
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 30)
                    .padding(.leading, 25)
                    
                    Spacer()
                    
                    HStack {
                        
                        VStack(spacing: 18) {
                            
                            NeumorphicButton(frameHeight: 94, labelText: "", onPress: {})
                                .overlay(
                                    HStack {
                                        
                                        Spacer()
                                        
                                        Image(systemName: "cloud.sun.rain.fill")
                                            .font(.system(size: 42, weight: Font.Weight.semibold, design: Font.Design.rounded))
                                            .foregroundColor(Color("Text"))
                                        
                                        Spacer()
                                        
                                        VStack {
                                            StandardText(textString: "\(String(format: "%.1f", observedWeather.weatherPublished?.main?.tempMin ?? 0))° - \(String(format: "%.1f", observedWeather.weatherPublished?.main?.tempMax ?? 0))°")
                                            StandardText(textString: "Feels Like: \(String(format: "%.1f", observedWeather.weatherPublished?.main?.temp ?? 0))°" )
                                        }
                                        
                                        Spacer()
                                    }
                            )
                            
                            VStack {
                                StandardText(textString: "Overcast Clouds")
                                StandardText(textString: "Moderate chance of rain")
                                StandardText(textString: "Bring a light jacket")
                            }
                            
                            ForEach(0 ..< (observedNews.newsPublished?.totalResults ?? 0)) { count in
                                NeumorphicButton(
                                    labelText: (self.observedNews.newsPublished?.articles?[count].title ?? ""),
                                    onPress: {
                                        UIApplication.shared.open(URL(string: (self.observedNews.newsPublished?.articles?[count].url ?? ""))!)
                                        
                                }
                                )
                            }
                            
                            VStack {
                                StandardText(textString: "News from NewsAPI.org", fontSize: 12)
                                    .onTapGesture {
                                        UIApplication.shared.open(URL(string: "https://newsapi.org/")!)
                                }
                                StandardText(textString: "Weather from OpenWeatherMap.org", fontSize: 12)
                                    .onTapGesture {
                                        UIApplication.shared.open(URL(string: "https://openweathermap.org/")!)
                                }
                            }
                        }
                    }
                    .offset( x: 0, y: -10)
                }
                
                
                //Spacer()
                
                BaseLogo()
                
            }
        }
    }
}

struct GoodMorningHome_Previews: PreviewProvider {
    static var previews: some View {
        GoodMorningHome()
    }
}
