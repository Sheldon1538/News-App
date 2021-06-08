//
//  APIClient.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import Foundation

typealias ResultCallback<Value> = (Result<Value, Error>) -> Void

protocol APIClient {
    func send<T: APIRequest>(_ request: T, completion: @escaping ResultCallback<T.Response>)
    func loadData(url: String, completion: @escaping ResultCallback<Data>)
}
