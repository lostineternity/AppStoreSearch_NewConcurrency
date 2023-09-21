//
//  SearchViewModel+Factory.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/21/23.
//

import Foundation

extension SearchViewModel {
    struct Factory {
        func make(dataModel: [ITunesSearchResultItem]) -> SearchViewModel {
            let entities = getEntities(from: dataModel)
            let sections = SearchSection(items: entities)
            return SearchViewModel(sections: [sections])
        }
    }
}

// MARK: - Private methods

extension SearchViewModel.Factory {
    typealias AppEntity = SearchViewModel.AppEntity
    
    private func getEntities(from dataModel: [ITunesSearchResultItem]) -> [AppEntity] {
        var entities = [AppEntity]()
        
        for (position, dataItem) in dataModel.enumerated() {
            guard let appStoreURL = URL(string: dataItem.trackViewUrl) else {
                continue
            }
            
            guard let iconURL = URL(string: dataItem.artworkUrl512) else {
                continue
            }
            
            entities.append(
                AppEntity(
                    id: dataItem.trackId,
                    bundleId: dataItem.bundleId,
                    position: position,
                    name: dataItem.trackName,
                    developer: dataItem.artistName,
                    rating: dataItem.averageUserRating,
                    appStoreURL: appStoreURL,
                    iconURL: iconURL,
                    screenshotsURLs: dataItem.screenshotUrls.compactMap({ URL(string: $0) })
                )
            )
        }
        
        return entities
    }
}
