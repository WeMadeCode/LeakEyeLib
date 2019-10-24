//
//  AppDelegate.swift
//  LeakEyeLib
//
//  Created by zhouxiang on 10/21/2019.
//  Copyright (c) 2019 zhouxiang. All rights reserved.
//

import UIKit
import LeakEyeLib

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        LeakEye.shared.open()
        
        
        return true
    }

  


}

