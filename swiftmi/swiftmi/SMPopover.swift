//
//  SMPopver.swift
//  swiftmi
//
//  Created by yangyin on 16/5/11.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa

class SMPopover {
    fileprivate class var appDelegate: AppDelegate {
        return NSApplication.shared().delegate as! AppDelegate
    }
    
    class func toggle() {
        if appDelegate.popover.isShown {
            close()
        } else {
            show()
        }
    }
    
    class func close() {
        if !appDelegate.popover.isShown {
            return
        }
        
        appDelegate.popover.close()
        appDelegate.eventMonitor?.stop()
    }
    
    class func show() {
        NSRunningApplication.current().activate(options: NSApplicationActivationOptions.activateIgnoringOtherApps)
        
        guard let button = appDelegate.statusItem.button else {
            return
        }
        
        appDelegate.eventMonitor?.start()
        appDelegate.popover.show(relativeTo: button.frame, of: button, preferredEdge: .minY)
    }

    
}
