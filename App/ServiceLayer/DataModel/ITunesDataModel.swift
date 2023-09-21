//
//  ItunesModel.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/18/23.
//

import Foundation

struct ITunesSearchResult: Codable {
    let results: [ITunesSearchResultItem]
}

struct ITunesSearchResultItem: Codable {
    let trackName: String
    let trackId: Int
    let bundleId: String
    let trackViewUrl: String
    let artworkUrl512: String
    let artistName: String
    let screenshotUrls: [String]
    let formattedPrice: String
    let averageUserRating: Double
}
