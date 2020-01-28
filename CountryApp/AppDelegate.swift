//
//  AppDelegate.swift
//  CountryApp
//
//  Created by Moosa Baloch on 29/01/2020.
//  Copyright © 2020 Moosa Baloch. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
  

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // Override point for customization after application launch.
        let rootController = UINavigationController()
        self.window!.rootViewController = rootController
        self.window?.makeKeyAndVisible()
        let dependencyConatiner = DependencyContainer(rootController: rootController)
        dependencyConatiner.start()
        return true
    }

   

}

