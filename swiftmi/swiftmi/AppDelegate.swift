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
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)

    let popover = NSPopover()
    var eventMonitor : EventMonitor?
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        if let button = statusItem.button {
            button.image = NSImage(named: "code")
            button.imagePosition = .imageLeft
            button.action = #selector(togglePopover)
        }
        
        eventMonitor = EventMonitor(mask: [.leftMouseDown, .rightMouseDown]) {
            [unowned self] event in
            if self.popover.isShown {
                SMPopover.close()
            }
        }
        popover.appearance = NSAppearance(named: NSAppearanceNameAqua)

        popover.contentViewController = PopoverViewController(nibName: "PopoverViewController", bundle: nil)
        popover.behavior = .transient

    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    
    
    func togglePopover(_ sender: AnyObject?) {
        SMPopover.toggle()
    }
    
    func quit() {
        NSApplication.shared().terminate(self)
    }


}

