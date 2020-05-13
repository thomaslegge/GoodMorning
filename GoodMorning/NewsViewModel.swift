//
//  NewsViewModel.swift
//  GoodMorning
//
//  Created by Thomas Legge on 23/04/20.
//  Copyright © 2020 Thomas Legge. All rights reserved.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var newsPublished: NewsData? = nil
    
    init() {
//            newsPublished = NewsData(
//                status: "DEBUG",
//                totalResults: 3,
//                articles: [
//                    Article(
//                        source: Source(id: "", name: ""),
//                        author: "",
//                        title: "",
//                        articleDescription: "",
//                        url: "http://www.example.com/",
//                        urlToImage: "",
//                        publishedAt: "",
//                        content: ""),
//
//                    Article(
//                        source: Source(id: "", name: ""),
//                        author: "",
//                        title: "",
//                        articleDescription: "",
//                        url: "http://www.example.com/",
//                        urlToImage: "",
//                        publishedAt: "",
//                        content: ""),
//
//                    Article(
//                        source: Source(id: "", name: ""),
//                        author: "",
//                        title: "",
//                        articleDescription: "",
//                        url: "http://www.example.com/",
//                        urlToImage: "",
//                        publishedAt: "",
//                        content: "")
//                ]
//            )
        
        let result = WebService()
        result.getNewsData { result in
            switch result {
            case .failure(let error):
                print("NewsViewModel Error: ", error)
            case .success(let news):
                self.newsPublished = news
            }
        }
    }
}
