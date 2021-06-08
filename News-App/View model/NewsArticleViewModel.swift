//
//  NewsArticleViewModel.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import Foundation

final class NewsArticleViewModel: Hashable {
    
    private let newsArticle: NewsArticle
    
    private var url: String {
        return newsArticle.url ?? UUID().uuidString
    }
    
    init(newsArticle: NewsArticle) {
        self.newsArticle = newsArticle
    }
    
    var articleTitle: String {
        return newsArticle.title ?? "No title"
    }
    
    var articleDescription: String {
        return newsArticle.description ?? "Article description is not available"
    }
    
    static func == (lhs: NewsArticleViewModel, rhs: NewsArticleViewModel) -> Bool {
        lhs.url == rhs.url
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
    }
}
