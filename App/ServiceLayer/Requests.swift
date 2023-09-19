//
//  Api.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/18/23.
//

import Foundation

enum Requests: URLRequestType, URLRequestConvertibleType {
    case getData
}

extension Requests {
    var path: String {
        switch self {
        case .getData:
            return ""
        default: return ""
        }
    }
    
    var method: String {
        switch self {
        case .getData:
            return ""
        default: return ""
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getData:
            return []
        default: return []
        }
    }
}
