//
//  AppDelegate.swift
//  HW13-Settings
//
//  Created by Onix qq on 22.06.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setWindow()
        return true
    }
    
    func setWindow() {
        let navigationController = UINavigationController(rootViewController: SettingsViewController())
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

