//
//  SearchService.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/18/23.
//

import Foundation

protocol SearchServiceType {
    func search() async -> [ITunesSearchResultItem]?
}

actor SearchService: SearchServiceType {
    func search() async -> [ITunesSearchResultItem]? {
        let result = await RequestLoader.perform(Requests.getData, to: ITunesSearchResult.self)
        switch result {
        case .success(let decodedData):
            return decodedData.results
        case .failure(let error):
            print(error.localizedDescription)
            return nil
        }
    }
}

