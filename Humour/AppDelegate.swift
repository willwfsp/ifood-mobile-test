//
//  AppDelegate.swift
//  Humour
//
//  Created by Willian on 11/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import UIKit
import TwitterKit
import Swinject
import Utils

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        let container = Container()
        let sceneProvider = SceneProvider(container: container)
        
        sceneProvider.configure()
        DomainProvider(container: container).configure()
        StoreProvider(container: container).configure()
        
        let searchViewController = sceneProvider.resolve(Constants.string.scene.search)
        let navigationController = UINavigationController(rootViewController: searchViewController!)
        navigationController.navigationBar.prefersLargeTitles = true
        window.rootViewController = navigationController
    
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }

}

