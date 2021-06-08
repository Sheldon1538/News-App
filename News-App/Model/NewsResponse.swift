//
//  NewsResponse.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import Foundation

struct NewsResponse: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [NewsArticle]
}
