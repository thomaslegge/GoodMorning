//
//  GoodMorningHome.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import SwiftUI

struct GoodMorningHome: View {
    
    var togglePage: () -> Void
    
    @ObservedObject var observedWeather = WeatherViewModel()
    @ObservedObject var observedNews = NewsViewModel()
    var userLoad = UserData()
    
    init(togglePage: @escaping () -> Void) {
        
        self.togglePage = togglePage
        
        let defaults = UserDefaults.standard
        
        if let savedUser = defaults.object(forKey: "userData") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                //print("Pre Load", userLoad.name, userLoad.city, userLoad.isFirstTimeStartup)
                userLoad = try jsonDecoder.decode(UserData.self, from: savedUser)
                //print("Post Load", userLoad.name, userLoad.city, userLoad.isFirstTimeStartup)
            } catch {
                print("Failed to load userData")
            }
        }
        
        print("User load: " + userLoad.city!)

    }
    
    var body: some View {
        GeometryReader { bounds in
            ZStack {
                
                Color("Background").edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    VStack {
                        HStack {
                            VStack(spacing: 0) {
                                HeroText(heroString: "Good Morning,", heroWidth: 330, heroHeight: 60)
                                    .offset(x: -10)
                                    .onTapGesture {
                                        self.togglePage()
                                }
                                if bounds.size.height > 749 {
                                    
                                    if (self.userLoad.name == nil) {
                                        HeroText(heroString: "How are you?", heroWidth: 330, heroHeight: 60)
                                            .offset(x: -10)
                                    } else {
                                        HeroText(heroString: "\(self.userLoad.name!)", heroWidth: 330, heroHeight: 60)
                                            .offset(x: -10)
                                    }
                                }
                                
                                if bounds.size.height > 749 {
                                    
                                    
                                    HStack {
                                        if (self.userLoad.city == nil) {
                                            StandardText(textString: "Today.")
                                        } else {
                                            StandardText(textString: "Today in \(self.userLoad.city!).")
                                        }
                                        
                                        Spacer()
                                    }
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
                                            
                                            Image(systemName: self.observedWeather.weatherIconName ?? "sun.max.fill")
                                                .font(.system(size: 42, weight: Font.Weight.semibold, design: Font.Design.rounded))
                                                .foregroundColor(Color("Text")
                                            ).allowsHitTesting(false)
                                            
                                            Spacer()
                                            
                                            VStack {
                                                StandardText(textString: "\(String(format: "%.1f", self.observedWeather.weatherPublished?.main?.tempMin ?? 0))° ~ \(String(format: "%.1f", self.observedWeather.weatherPublished?.main?.tempMax ?? 0))°")
                                                StandardText(textString: "Feels Like: \(String(format: "%.1f", self.observedWeather.weatherPublished?.main?.temp ?? 0))°" )
                                            }.allowsHitTesting(false)
                                            
                                            Spacer()
                                        }
                                )
                                
                                VStack {
                                    StandardText(textString: self.observedWeather.weatherDescStylised ?? "")
                                    if bounds.size.height > 749 {

                                    StandardText(textString: self.observedWeather.weatherSecondary ?? "")
                                    }
                                    StandardText(textString: self.observedWeather.weatherBringJacket ?? "")
                                    
                                }
                                
                                NeumorphicButton(
                                    labelText: (self.observedNews.newsPublished?.articles?[0].title ?? ""),
                                    onPress: {
                                        UIApplication.shared.open(URL(string: (self.observedNews.newsPublished?.articles?[0].url ?? ""))!)
                                })
                                NeumorphicButton(
                                    labelText: (self.observedNews.newsPublished?.articles?[1].title ?? ""),
                                    onPress: {
                                        UIApplication.shared.open(URL(string: (self.observedNews.newsPublished?.articles?[1].url ?? ""))!)
                                })
                                NeumorphicButton(
                                    labelText: (self.observedNews.newsPublished?.articles?[2].title ?? ""),
                                    onPress: {
                                        UIApplication.shared.open(URL(string: (self.observedNews.newsPublished?.articles?[2].url ?? ""))!)
                                })
                                
                                
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
                    
                    BaseLogo()
                }
            }
        }
    }
}

struct GoodMorningHome_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GoodMorningHome(togglePage: {
                print("Preview_TogglePage")
            })
                .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            
            GoodMorningHome(togglePage: {
                print("Preview_TogglePage")
            })
                .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
//            
//            GoodMorningHome(togglePage: {
//                print("Preview_TogglePage")
//            })
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
//            
//            GoodMorningHome(togglePage: {
//                print("Preview_TogglePage")
//            })
//                .previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro Max"))
        }
    }
}
