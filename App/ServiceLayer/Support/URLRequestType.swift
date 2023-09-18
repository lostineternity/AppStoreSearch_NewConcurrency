//
//  RequestType.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/18/23.
//

import Foundation

protocol URLRequestType {
    var baseUrl: String { get }
    var path: String { get }
    var method: String { get }
    var parameters: [URLQueryItem] { get }
}
