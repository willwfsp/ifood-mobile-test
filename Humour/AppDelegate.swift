//
//  AppDelegate.swift
//  Humour
//
//  Created by Willian on 11/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import UIKit
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        TWTRTwitter.sharedInstance().start(withConsumerKey: "GIuEde4dv1J8D7IVL3DcIo33N", consumerSecret: "P3wIJ3ycjPInBS4llox8bken43YUccfDuuI5pHQBfbg1hyOKI7")
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        self.window = window
        
        window.rootViewController = SceneProvider.shared.resolve(R.string.scene.search())
    
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }

}

