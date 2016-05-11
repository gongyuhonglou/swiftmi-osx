//
//  SMPopver.swift
//  swiftmi
//
//  Created by yangyin on 16/5/11.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa

class SMPopover {
    private class var appDelegate: AppDelegate {
        return NSApplication.sharedApplication().delegate as! AppDelegate
    }
    
    class func toggle() {
        if appDelegate.popover.shown {
            close()
        } else {
            show()
        }
    }
    
    class func close() {
        if !appDelegate.popover.shown {
            return
        }
        
        appDelegate.popover.close()
    }
    
    class func show() {
        NSRunningApplication.currentApplication().activateWithOptions(NSApplicationActivationOptions.ActivateIgnoringOtherApps)
        
        guard let button = appDelegate.statusItem.button else {
            return
        }
        
        appDelegate.popover.showRelativeToRect(button.frame, ofView: button, preferredEdge: .MinY)
    }

    
}