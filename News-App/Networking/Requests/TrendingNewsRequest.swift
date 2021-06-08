//
//  TrendingNewsRequest.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import Foundation

struct TrendingNewsRequest: APIRequest {
    var resourceName: String {
        return NewsAPIData.baseURL + NewsAPIData.Version.v2 + NewsAPIData.Endpoint.headlines + NewsAPIData.Params.country + "us" + NewsAPIData.Params.apiKey + NewsAPIData.apiKey
    }
    
    var request: URLRequest? {
        guard let url = URL(string: resourceName) else { return nil }
        return URLRequest(url: url)
    }
    
    typealias Response = NewsResponse
}
