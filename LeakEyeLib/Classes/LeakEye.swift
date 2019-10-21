//
//  LeakEye.swift
//  Pods
//
//  Created by zixun on 16/12/12.
//
//

import Foundation

/// MARK: - LeakEyeDelegate
public protocol LeakEyeDelegate: NSObjectProtocol {
    func leakEye(_ leakEye:LeakEye,didCatchLeak object:NSObject)
}

/// MARK: - LeakEye
open class LeakEye: NSObject {
    /// 代理属性，用于输出泄漏的对象
    open weak var delegate: LeakEyeDelegate?
    
    /// 用于扫描的定时器
    private var timer: Timer?
    
    /// 判断检查内存泄漏工具是否开启
    open var isOpening: Bool {
        get {
            return self.timer?.isValid ?? false
        }
    }

    /// MARK: LIFE CYCLE
    public override init() {
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(LeakEye.receive), name: NSNotification.Name.Receive, object: nil)
    }
    

    /// 开启内存泄漏检测工具
    open func open() {
        Preparer.binding()
        self.startPingTimer()
    }
    
    
    /// 关闭内存泄漏检测工具
    open func close() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    

    
}



/// MARK: - 私有方法
extension LeakEye{
    
    private func startPingTimer() {
        if Thread.isMainThread == false {
            DispatchQueue.main.async {
                self.startPingTimer()
                return
            }
        }
        self.close()
        
        self.timer = Timer.scheduledTimer(timeInterval: 0.5,
                                          target: self,
                                          selector: #selector(LeakEye.scan),
                                          userInfo: nil,
                                          repeats: true)
        
    }
    
    @objc private func scan()  {
        NotificationCenter.default.post(name: NSNotification.Name.Scan, object: nil)
    }
    
    @objc private func receive(notif:NSNotification) {
        guard let leakObj = notif.object as? NSObject else { return }
        self.delegate?.leakEye(self, didCatchLeak: leakObj)
    }
}
