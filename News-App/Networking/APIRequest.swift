//
//  APIRequest.swift
//  News-App
//
//  Created by Konstantin on 08.06.2021.
//

import Foundation

protocol APIRequest: Encodable {
    associatedtype Response: Decodable
    var resourceName: String { get }
    var request: URLRequest? { get }
}
