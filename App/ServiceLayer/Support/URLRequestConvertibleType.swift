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
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.queryItems?.append(contentsOf: parameters ?? [])
        
        guard let url = urlComponents.url else {
            throw AppError.badURL(info: urlComponents.string ?? "unknown url")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        
        return request
    }
}

extension URLRequestConvertibleType {
    public var urlRequest: URLRequest? { try? asURLRequest() }
}
