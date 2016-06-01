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
    
    func formatDate(date:NSDate)->String {
        
        let fmt = NSDateFormatter()
        
        fmt.dateFormat = "yyyy-MM-dd"
        let dateString = fmt.stringFromDate(date)
        return dateString
    }
    
    func configureData(article:Article) {
       titleTextView.stringValue = article.title!
       sourceTextView.stringValue = article.source!
       let createDate = NSDate(timeIntervalSince1970: article.createDate)
       dateTextView.stringValue = formatDate(createDate)
    }
    
    override func mouseEntered(theEvent: NSEvent) {
        self.layer?.backgroundColor = NSColor.sm_highlightColor().CGColor
    }
    
    override func mouseExited(theEvent: NSEvent) {
        
        self.layer?.backgroundColor = NSColor.sm_whiteColor().CGColor

    }
}
