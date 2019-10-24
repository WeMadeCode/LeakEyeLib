//
//  Test4ViewController.swift
//  LeakEyeLib_Example
//
//  Created by zhouxiang on 2019/10/24.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class Test4ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.orange
        
        
        Single.shared.array.append(self)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


class Single {
    
    static let shared = Single()
    
    
    var array = [UIViewController]()
    
    
}
