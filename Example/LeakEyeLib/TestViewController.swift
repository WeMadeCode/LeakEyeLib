//
//  TestViewController.swift
//  LeakEyeLib_Example
//
//  Created by zhouxiang on 2019/10/21.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class LeakTest: NSObject {
    
    var block: (() -> ())
    
    init(block: @escaping () -> () ) {
        self.block = block
        super.init()
    }
}

class TestViewController: UIViewController {

    
    
    private var test : LeakTest?
     
     private var str: String = ""
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "循环引用"

        self.view.backgroundColor = UIColor.white
        
        
        self.test = LeakTest {
            self.str.append("leak")
        }
        
    }
    

    deinit {
        print("deinit")
    }
  

}
