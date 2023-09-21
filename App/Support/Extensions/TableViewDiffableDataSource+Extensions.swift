//
//  TableViewDiffableDataSource+Extensions.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/21/23.
//

import UIKit

protocol DiffableSectionType: Hashable {
    associatedtype ItemType: Hashable
    var items: [ItemType] { get }
}

final class TableViewDiffableDataSource<SectionType: DiffableSectionType>: UITableViewDiffableDataSource<SectionType, SectionType.ItemType> {
    
    func update(with sections: [SectionType], animated: Bool? = nil) {
        var snapshot = NSDiffableDataSourceSnapshot<SectionType, SectionType.ItemType>()
        
        snapshot.appendSections(sections)
        
        sections.forEach { section in
            snapshot.appendItems(section.items, toSection: section)
        }
        
        apply(snapshot, animatingDifferences: animated ?? true)
    }
}
