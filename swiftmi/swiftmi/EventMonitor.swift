//
//  EventMonitor.swift
//  swiftmi
//
//  Created by yangyin on 16/5/16.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa

public class EventMonitor {
    private var monitor: AnyObject?
    private let mask: NSEventMask
    private let handler: NSEvent? -> ()
    
    public init(mask:NSEventMask, handler:NSEvent? -> ()){
        self.mask = mask
        self.handler = handler
    }
    
    deinit {
        stop()
    }
    
    public func start() {
        monitor = NSEvent.addGlobalMonitorForEventsMatchingMask(self.mask, handler: self.handler)
    }
    
    public func stop() {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
    }
}

