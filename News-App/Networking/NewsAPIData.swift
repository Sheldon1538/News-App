//
//  NewsAPIData.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import Foundation

enum NewsAPIData {
    static let baseURL = "https://newsapi.org"
    static let apiKey = "87d9009ab83d49b390f99bddc2d337cc"
    
    enum Endpoint {
        static let headlines = "/top-headlines"
    }
    
    enum Params {
        static let country = "?country="
        static let apiKey = "&apiKey="
    }
    
    enum Version {
        static let v2 = "/v2"
    }
}
