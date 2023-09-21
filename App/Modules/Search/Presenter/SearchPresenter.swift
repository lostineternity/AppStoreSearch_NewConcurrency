//
//  SearchPresenter.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/20/23.
//

import Foundation

protocol SearchPresenterType: PresenterType {
    func viewDidLoad()
}

final class SearchPresenter {

    weak var view: SearchViewType!
    
    private var networkService: SearchServiceType
    
    public init(view: SearchViewType, networkService: SearchServiceType) {
        self.view = view
        self.networkService = networkService
    }
}

// MARK: - Private methods
private extension SearchPresenter {
    
}

// MARK: - SearchPresenterType
extension SearchPresenter: SearchPresenterType {
    func viewDidLoad() {
        view.renderView(with: SearchViewModel.mockModel)
    }
}
