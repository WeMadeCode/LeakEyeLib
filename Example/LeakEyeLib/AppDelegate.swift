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

    
    var eye = LeakEye()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.eye.delegate = self
        self.eye.open()
        
        return true
    }

  


}

extension AppDelegate: LeakEyeDelegate {
    func leakEye(_ leakEye:LeakEye,didCatchLeak object:NSObject) {
        let msg = "对象\(object)存在内存泄漏"
        let alert = UIAlertController(title: "提示", message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "确定", style: .default, handler: nil)
        alert.addAction(action)
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}

