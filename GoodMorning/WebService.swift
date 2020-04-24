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
    func getWeatherData(completion: @escaping (Result<WeatherData, Error>) -> ()) {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=Auckland,nz&appid=9b7cd1bf1c97bcc7598dac88d50b7510&units=metric") else {
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
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?apiKey=bb82b42734674b1e8147c1f448b6d748&country=nz") else {
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

