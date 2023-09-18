//
//  SearchService.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/18/23.
//

import Foundation

protocol SearchServiceType {
    func search() async throws -> [ITunesSearchResultItem]
}

actor SearchService: SearchServiceType {
    private let loader = RequestLoader()
    
    func search() async throws -> [ITunesSearchResultItem] {
        let data = try await loader.perform(Requests.getData)
        let decodedData = try JSONDecoder().decode(ITunesSearchResult.self, from: data)
        
        return decodedData.results
    }
}
