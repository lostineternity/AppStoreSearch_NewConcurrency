//
//  SearchModule.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/20/23.
//

import Foundation

class SearchModule {

    static func initialize() -> ViewType {
        let vc = SearchViewController()
        let networkService = SearchService()
        let presenter = SearchPresenter(view: vc, networkService: networkService)
        vc.presenter = presenter
        return vc
    }
}
