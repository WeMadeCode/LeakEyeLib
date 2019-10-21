//
//  ViewController.swift
//  LeakEyeLib
//
//  Created by zhouxiang on 10/21/2019.
//  Copyright (c) 2019 zhouxiang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func btnOneClick(_ sender: Any) {
        let vc = TestViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func btnTwoClick(_ sender: Any) {
        let vc = Test2ViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
 

}

