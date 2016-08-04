//
//  AppDelegate.swift
//  ScrollViewBug
//
//  Created by Colm Du Ve on 04/08/2016.
//  Copyright © 2016 dooverSoft. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if window == nil {
            let bounds = UIScreen.mainScreen().bounds
            let window = UIWindow(frame: bounds)
            self.window = window
        }
        
        let rootViewController = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()).instantiateViewControllerWithIdentifier("SignUpViewController")
        self.window?.rootViewController = rootViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

