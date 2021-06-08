//
//  TrendingNewsViewModel.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import Foundation

protocol TrendingNewsViewModelProtocol: ViewModelImageRepresentable, AnyObject {
    var  didUpdateNews: (([NewsArticleViewModel]) -> Void)? { get set }
}

protocol ViewModelImageRepresentable {
    func loadImageData(url: String, completion: @escaping(Data) -> Void)
}

final class TrendingNewsViewModel: TrendingNewsViewModelProtocol {
    var didUpdateNews: (([NewsArticleViewModel]) -> Void)?
    
    private let apiService: APIClient
    private var imageDataCache = NSCache<NSString, NSData>()
    
    private var newsArticles: [NewsArticle] = [] {
        didSet {
            didUpdateNews?(self.newsArticles.map { NewsArticleViewModel(newsArticle: $0) })
        }
    }
    
    init(apiService: APIClient) {
        self.apiService = apiService
    }
    
    func fetchNewsArticles() {
        let request = TrendingNewsRequest()
        apiService.send(request) { result in
            switch result {
            case .success(let response):
                self.newsArticles = response.articles
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loadImageData(url: String, completion: @escaping (Data) -> Void) {
        
    }
}
