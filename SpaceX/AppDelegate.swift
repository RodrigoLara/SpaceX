//
//  AppDelegate.swift
//  SpaceX
//
//  Created by Rodrigo Lara on 09/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: SpaceMasterViewController(nibName: "SpaceMasterViewController", bundle: nil))
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

