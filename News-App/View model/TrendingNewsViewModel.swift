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
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(fetchNewsArticles), userInfo: nil, repeats: true)
    }
    
    @objc func fetchNewsArticles() {
        print(#function)
        let request = TrendingNewsRequest()
        apiService.send(request) { result in
            switch result {
            case .success(let response):
                if response.articles != self.newsArticles {
                    self.newsArticles = response.articles
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loadImageData(url: String, completion: @escaping (Data) -> Void) {
        if let cachedImageData = imageDataCache.object(forKey: url as NSString) {
            completion(cachedImageData as Data)
        } else {
            apiService.loadData(url: url) { (result) in
                switch result {
                case .success(let data):
                    self.imageDataCache.setObject(data as NSData, forKey: url as NSString)
                    completion(data)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
