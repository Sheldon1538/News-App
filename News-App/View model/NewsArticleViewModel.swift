//
//  NewsArticleViewModel.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import Foundation

final class NewsArticleViewModel: Hashable {
    
    private let newsArticle: NewsArticle
    
    var url: String {
        return newsArticle.url
    }
    
    var imageURL: String? {
        return newsArticle.urlToImage
    }
    
    init(newsArticle: NewsArticle) {
        self.newsArticle = newsArticle
    }
    
    var articleTitle: String {
        return newsArticle.title ?? "No title"
    }
    
    var articleDescription: String {
        return newsArticle.content ?? "Article description is not available"
    }
    
    static func == (lhs: NewsArticleViewModel, rhs: NewsArticleViewModel) -> Bool {
        (lhs.url == rhs.url) && (lhs.articleDescription == rhs.articleDescription)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
    }
}
