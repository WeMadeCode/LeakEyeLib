//
//  Test2ViewController.swift
//  LeakEyeLib_Example
//
//  Created by zhouxiang on 2019/10/21.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

class Test2ViewController: UIViewController {

    
    weak var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
        self.title = "定时器"
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(fire), userInfo: nil, repeats: true)
        
    }
    
    @objc func fire(){
        print("----")
    }

    
    deinit {
        self.timer?.invalidate()
        print("deinit")
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
