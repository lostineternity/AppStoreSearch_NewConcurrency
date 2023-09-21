//
//  ViewControllerType.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/20/23.
//

import UIKit

protocol ViewType: UIViewController {}

extension ViewType {
    var viewController: UIViewController {
        return self
    }
}
