//
//  EventMonitor.swift
//  swiftmi
//
//  Created by yangyin on 16/5/16.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa

open class EventMonitor {
    fileprivate var monitor: AnyObject?
    fileprivate let mask: NSEventMask
    fileprivate let handler: (NSEvent?) -> ()
    
    public init(mask:NSEventMask, handler:@escaping (NSEvent?) -> ()){
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    open func start() {
        monitor = NSEvent.addGlobalMonitorForEvents(matching: self.mask, handler: self.handler) as AnyObject?
    }
    
    open func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}

