//
//  AppDelegate.swift
//  AppStoreSearch_NewConcurrency
//
//  Created by Vadym Sokol on 9/18/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let vc = SearchModule.initialize()
        window.rootViewController = vc
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

