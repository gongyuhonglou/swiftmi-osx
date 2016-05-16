//
//  AppDelegate.swift
//  swiftmi
//
//  Created by yangyin on 16/5/9.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)

    let popover = NSPopover()
    var eventMonitor : EventMonitor?
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: "code")
            button.imagePosition = .ImageLeft
            button.action = #selector(togglePopover)
        }
        
        eventMonitor = EventMonitor(mask: [.LeftMouseDownMask, .RightMouseDownMask]) {
            [unowned self] event in
            if self.popover.shown {
                SMPopover.close()
            }
        }
        popover.contentViewController = ArticlesViewController(nibName: "ArticlesViewController", bundle: nil)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    
    
    func togglePopover(sender: AnyObject?) {
        SMPopover.toggle()
    }


}

