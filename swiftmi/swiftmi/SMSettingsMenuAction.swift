//
//  SMSettingsMenuAction.swift
//  swiftmi
//
//  Created by yangyin on 16/5/24.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa

class SMSettingsMenuAction: NSObject {

    class func perform(sender: NSView) {

        let delegate = NSApplication.sharedApplication().delegate as! AppDelegate
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(delegate.quit), keyEquivalent: "q"))
        NSMenu.popUpContextMenu(menu, withEvent: NSApp.currentEvent!, forView: sender)

    }
}
