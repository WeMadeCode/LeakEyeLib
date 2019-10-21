//
//  ObjectAgent.swift
//  Pods
//
//  Created by zixun on 16/12/12.
//
//

import Foundation

//--------------------------------------------------------------------------
// MARK: - ObjectAgent
// DESCRIPTION: the agent of object instance
//--------------------------------------------------------------------------
class ObjectAgent: NSObject {
    
    //--------------------------------------------------------------------------
    // MARK: INTERNAL PROPERTY
    //--------------------------------------------------------------------------
    weak var object: NSObject?
    
    weak var host: NSObject?
    
    weak var responder: NSObject?
    
    //--------------------------------------------------------------------------
    // MARK: LIFE CYCLE
    //--------------------------------------------------------------------------
    init(object: NSObject) {
        super.init()
        self.object = object
        
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.Scan,
                                                  object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleScan),
                                               name: NSNotification.Name.Scan,
                                               object: nil)
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self,
                                                  name: NSNotification.Name.Scan,
                                                  object: nil)
    }
    
    //--------------------------------------------------------------------------
    // MARK: PRIVATE FUNCTION
    //--------------------------------------------------------------------------
    @objc private func handleScan() {
        
        if self.object == nil {
            return
        }
        
        if self.didNotified {
            return
        }
        
        let alive = self.object?.isAlive()
        if alive == false {
            self.leakCheckFailCount += 1
        }
        
        if self.leakCheckFailCount >= 5 {
            self.notifyPossibleLeak()
        }
    }
    
    private func notifyPossibleLeak() {
        if self.didNotified {
            return
        }
        
        self.didNotified = true
        NotificationCenter.default.post(name: NSNotification.Name.Receive, object: self.object)
    }
    
    //--------------------------------------------------------------------------
    // MARK: PRIVATE PROPERTY
    //--------------------------------------------------------------------------
    private var didNotified: Bool = false
    
    fileprivate var leakCheckFailCount: Int = 0
}
