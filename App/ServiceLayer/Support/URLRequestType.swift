//
//  RequestType.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/18/23.
//

import Foundation

protocol URLRequestType {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: String { get }
    var parameters: [URLQueryItem]? { get }
    var headers: [String: String]? { get }
}

extension URLRequestType {
    var scheme: String {
        return "https"
    }
    
    var host: String {
        return AppConstants.baseHost
    }
    
    var parameters: [URLQueryItem]? {
        return []
    }
    
    var header: [String: String]? {
        return [:]
    }
}
