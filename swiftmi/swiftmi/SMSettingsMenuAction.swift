//
//  SMSettingsMenuAction.swift
//  swiftmi
//
//  Created by yangyin on 16/5/24.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa

class SMSettingsMenuAction: NSObject {

    class func perform(_ sender: NSView) {

        let delegate = NSApplication.shared().delegate as! AppDelegate
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Quit", action: #selector(delegate.quit), keyEquivalent: "q"))
        NSMenu.popUpContextMenu(menu, with: NSApp.currentEvent!, for: sender)

    }
}
