//
//  UITableView+Extensions.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/21/23.
//

import UIKit

extension UITableView {
    
    func register<Cell: UITableViewCell>(_ cellType: Cell.Type) {
        register(Cell.self, forCellReuseIdentifier: Cell.identifier)
    }
    
    func reuse<Cell: UITableViewCell>(_ cellType: Cell.Type, for indexPath: IndexPath) -> Cell? {
        dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell
    }
}

