//
//  NetworkError.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/18/23.
//

import Foundation

enum AppError: Error, CustomStringConvertible {
    case badURL(info: String)
    case noResponse
    case badResponse(statusCode: Int)
    case decode
    case unknown
    
    var description: String {
        switch self {
        case .badURL(let info): return "Bad url string: \(info)"
        case .decode: return "Error occured during decoding"
        case .noResponse: return "No server response"
        case .badResponse(let statusCode): return "Bad server response. Status code: \(statusCode). \(localization(for: statusCode))"
        default: return "Unknown error"
        }
    }
    
    func localization(for statusCode: Int) -> String {
        HTTPURLResponse.localizedString(forStatusCode: statusCode)
    }
}
