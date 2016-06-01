//
//  NSColor+SwiftMi.swift
//  swiftmi
//
//  Created by yangyin on 16/5/30.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa

extension NSColor {
    
    class func sm_whiteColor() -> NSColor {
        return NSColor.whiteColor()
    }
    
    class func sm_highlightColor() -> NSColor {
        return NSColor(calibratedRed: 249/255, green: 249/255, blue: 249/255, alpha: 1)
    }

}
