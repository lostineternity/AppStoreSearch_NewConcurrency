//
//  RequestsLoader.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/18/23.
//

import Foundation

protocol RequestLoaderType {
    static func perform<T: Codable>(_ request: URLRequestConvertibleType, to type: T.Type) async -> Result<T, Error>
}

struct RequestLoader: RequestLoaderType {
    static let session = URLSession.shared
    
    static func perform<T: Codable>(_ request: URLRequestConvertibleType, to type: T.Type) async -> Result<T, Error> where T: Codable {
        do {
            let request = try request.asURLRequest()
            
            let (data, response) = try await session.data(for: request)
            
            guard let response = response as? HTTPURLResponse else {
                return .failure(AppError.noResponse)
            }
            
            guard (200..<300).contains(response.statusCode) else {
                return .failure(AppError.badResponse(statusCode: response.statusCode))
            }

            guard let decodedData = try? JSONDecoder().decode(type, from: data) else {
                return .failure(AppError.decode)
            }
            
            return .success(decodedData)
        } catch let error {
            return .failure(error)
        }
    }
}
