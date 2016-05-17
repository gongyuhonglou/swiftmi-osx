//
//  TBCell.swift
//  swiftmi
//
//  Created by yangyin on 16/5/17.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa

class TBCell: NSTableCellView {
    
    @IBOutlet weak var titleTextView: NSTextField!
    
    @IBOutlet weak var sourceTextView: NSTextField!

    @IBOutlet weak var dateTextView: NSTextField!

    override func drawRect(dirtyRect: NSRect) {
        super.drawRect(dirtyRect)

        // Drawing code here.
    }
    
}
