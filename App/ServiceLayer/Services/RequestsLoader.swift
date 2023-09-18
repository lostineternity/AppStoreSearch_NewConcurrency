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
    static func perform<T: Codable>(_ request: URLRequestConvertibleType, to type: T.Type) async -> Result<T, Error> {
        do {
            let request = try request.asURLRequest()
            
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let response = response as? HTTPURLResponse,
                  (200..<300).contains(response.statusCode) else {
                return .failure(AppError.badResponse)
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
