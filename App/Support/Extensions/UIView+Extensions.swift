//
//  UIView+Extensions.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/21/23.
//

import UIKit

extension UIView {
    
    enum Side {
        case right(_ value: CGFloat)
        case top(_ value: CGFloat)
        case left(_ value: CGFloat)
        case bottom(_ value: CGFloat)
    }
    
    func addConstraints(to view: UIView, with values: [Side]) {
        let constraints = values.map { side -> NSLayoutConstraint in
            switch side {
            case .top(let value):
                return topAnchor.constraint(equalTo: view.topAnchor, constant: value)
            case .left(let value):
                return leftAnchor.constraint(equalTo: view.leftAnchor, constant: value)
            case .right(let value):
                return rightAnchor.constraint(equalTo: view.rightAnchor, constant: value)
            case .bottom(let value):
                return bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: value)
            }
        }
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func addZeroConstraintsToSuperview() {
        guard let superview = superview else { return }
        
        addConstraints(to: superview, with: [
            .right(0),
            .left(0),
            .top(0),
            .bottom(0)
        ])
    }
}
