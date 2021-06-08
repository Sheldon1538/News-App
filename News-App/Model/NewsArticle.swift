//
//  NewsArticle.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import Foundation

struct NewsArticle: Decodable {
    var source: NewsArticleSource?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
