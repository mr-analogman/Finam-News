//
//  Model.swift
//  Finam News
//
//  Created by mr_aNalogman on 8/21/21.
//  Copyright © 2021 mr_aNalogman. All rights reserved.
//

import Foundation

//MARK: structs

//
// Full JSON from NewsAPI
//
struct NewsResponse: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [CurrentNewsItem]
    
    init(status: String, totalResults: Int?, articles: [CurrentNewsItem]) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
    
    init() {
        self.status = ""
        self.totalResults = 0
        self.articles = []
    }
}

//
// One Article JSON from NewsAPI
//
struct CurrentNewsItem: Decodable {
    var title: String?
    var author: String?
    var description: String?
    var content: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    
    init(title: String, author: String, content: String, description: String, url: String, urlToImage: String, publishedAt: String) {
        self.title = title
        self.author = author
        self.content = content
        self.description = description
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
    }
}


// MARK: const & vars
let query = URL(string: "https://newsapi.org/v2/top-headlines?q=apple&pageSize=100&apiKey=a1a1ac08431d41159d8080b743c5e4d1")!

//Global News Array
var newsArr = NewsResponse()

//Index to show selected news item
var selectedNewsRow: Int = -1
