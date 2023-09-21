//
//  SearchModel.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/20/23.
//

import Foundation

struct SearchViewModel {
    
    struct SearchSection: DiffableSectionType {
        typealias ItemType = AppEntity
        
        var items: [ItemType]
    }
    
    struct AppEntity: Hashable {
        let id: Int
        let bundleId: String
        let position: Int

        let name: String
        let developer: String
        let rating: Double

        let appStoreURL: URL
        let iconURL: URL
        let screenshotsURLs: [URL]

        static func == (lhs: AppEntity, rhs: AppEntity) -> Bool {
            lhs.id == rhs.id
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
    }
    
    var sections: [SearchSection] = []
}

extension SearchViewModel {
    static let mockModel: SearchViewModel = {
        return SearchViewModel(
            sections: [
                SearchSection(items: [
                    .mockEntity(with: 1),
                    .mockEntity(with: 2),
                    .mockEntity(with: 3)
                ]),
                SearchSection(items: [
                    .mockEntity(with: 4),
                    .mockEntity(with: 5)
                ])
            ]
        )
    }()
}

extension SearchViewModel.AppEntity {
    static func mockEntity(with id: Int) -> Self {
        SearchViewModel.AppEntity(
            id: id,
            bundleId: "test",
            position: 1,
            name: "test name \(id)",
            developer: "test developer",
            rating: 4.99,
            appStoreURL: URL(string: "http://google.com.ua")!,
            iconURL: URL(string: "http://google.com.ua")!,
            screenshotsURLs: [URL(string: "http://google.com.ua")!]
        )
    }
}
