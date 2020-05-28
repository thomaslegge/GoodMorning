//
//  WebService.swift
//  GoodMorning
//
//  Created by Thomas Legge on 22/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import Foundation

enum WeatherError: Error {
    case noDataAvailable
    case cannotProccesData
}

class WebService {
    
    var userLoad = UserData()
    
    init() {
                
        if let savedUser = UserDefaults.standard.object(forKey: "userData") as? Data {
            let jsonDecoder = JSONDecoder()
            
            do {
                //print("Pre Load", userLoad.name, userLoad.city, userLoad.isFirstTimeStartup)
                userLoad = try jsonDecoder.decode(UserData.self, from: savedUser)
                //print("Post Load", userLoad.name, userLoad.city, userLoad.isFirstTimeStartup)
            } catch {
                print("Failed to load userData")
            }
        }
    }
    
    func getWeatherData(completion: @escaping (Result<WeatherData, Error>) -> ()) {
                
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=" + userLoad.cityCode() + ",nz&" + "SECRET" + "&units=metric") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(WeatherData.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(weather))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getNewsData(completion: @escaping (Result<NewsData, Error>) -> ()) {
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?" + "SECRET" + "&country=nz") else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(.failure(error!))
                }
                return
            }
            
            do {
                let news = try JSONDecoder().decode(NewsData.self, from: data)
                DispatchQueue.main.async {
                    //print(news)
                    completion(.success(news))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

