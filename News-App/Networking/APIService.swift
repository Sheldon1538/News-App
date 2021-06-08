//
//  APIService.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import Foundation

class APIService: APIClient {
    private let session = URLSession(configuration: .default)
    
    func send<T>(_ request: T, completion: @escaping ResultCallback<T.Response>) where T : APIRequest {
        guard let urlRequest = request.request else { return }
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                do {
                    let apiResponse = try JSONDecoder().decode((T.Response).self, from: data)
                    completion(.success(apiResponse))
                } catch let error {
                    print(error)
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    func loadData(url: String, completion: @escaping ResultCallback<Data>) {
        guard let url = URL(string: url) else { return }
        session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
}
