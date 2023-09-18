//
//  NetworkError.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/18/23.
//

import Foundation

enum AppError: Error, CustomStringConvertible {
    case badURL(info: String)
    case badResponse
    case decode
    case unknown
    
    var description: String {
        switch self {
        case .badURL(let info): return "Bad url string: \(info)"
        case .decode: return "Error occured during decoding"
        case .badResponse: return "Bad server response"
        default: return "Unknown error"
        }
    }
}
