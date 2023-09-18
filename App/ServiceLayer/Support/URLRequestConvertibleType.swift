//
//  URLRequestConvertible.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/18/23.
//

import Foundation

protocol URLRequestConvertibleType {
    func asURLRequest() throws -> URLRequest
}

extension URLRequestConvertibleType where Self: URLRequestType {
    func asURLRequest() throws -> URLRequest {
        var urlComponents = URLComponents(string: AppConstants.baseURL)
        urlComponents?.path = path
        urlComponents?.queryItems?.append(contentsOf: parameters)
        
        guard let url = urlComponents?.url else {
            throw AppError.badURL(info: urlComponents?.string ?? "unknown url")
        }
        
        let request = URLRequest(url: url)
        
        return request
    }
}

extension URLRequestConvertibleType {
    public var urlRequest: URLRequest? { try? asURLRequest() }
}
