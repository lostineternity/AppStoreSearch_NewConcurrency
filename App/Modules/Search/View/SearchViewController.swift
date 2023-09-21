//
//  SearchViewController.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/20/23.
//

import UIKit

protocol SearchViewType: ViewType {
    func renderView(with viewModel: SearchViewModel)
    func showError(with error: Error)
}

final class SearchViewController: UIViewController {
    private typealias Section = SearchViewModel.SearchSection
    
    // MARK: - UI properties
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(Constants.tableViewCellClass)
        return tableView
    }()
    
    private lazy var diffableDataSource: TableViewDiffableDataSource<Section> = {
        let dataSource = TableViewDiffableDataSource<Section>(tableView: tableView) { tableView, indexPath, itemIdentifier in
            let cell = tableView.reuse(Constants.tableViewCellClass, for: indexPath)
            return cell ?? UITableViewCell()
        }
        return dataSource
    }()
    
    // MARK: - dependencies
    
    var presenter: SearchPresenterType!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter.viewDidLoad()
    }
}

// MARK: - Private methods

private extension SearchViewController {
    private func setupUI() {
        view.addSubview(tableView)
        tableView.addZeroConstraintsToSuperview()
    }
}

// MARK: - SearchViewType

extension SearchViewController: SearchViewType {
    func renderView(with viewModel: SearchViewModel) {
        // TODO: - Render view
        tableView.delegate = self
        diffableDataSource.update(with: viewModel.sections)
    }
    
    func showError(with error: Error) {
        // TODO: - error handling
    }
}

// MARK: - UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: - implement
    }
}

// MARK: - Private view constants

fileprivate enum Constants {
    static var tableViewCellClass = SearchTableViewCell.self
}
