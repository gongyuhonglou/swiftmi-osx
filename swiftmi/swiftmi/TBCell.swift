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

    @IBOutlet weak var wrapView: NSView!

    private var trackingArea: NSTrackingArea?
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
    
    private func createTrackingAreaIfNeeded() {
        if trackingArea == nil {
            trackingArea = NSTrackingArea(rect: CGRect.zero, options: [NSTrackingAreaOptions.InVisibleRect, NSTrackingAreaOptions.MouseEnteredAndExited, NSTrackingAreaOptions.ActiveAlways], owner: self, userInfo: nil)
        }
    }
    
    override func updateTrackingAreas() {
        super.updateTrackingAreas()
        
        createTrackingAreaIfNeeded()
        
        if !trackingAreas.contains(trackingArea!) {
            addTrackingArea(trackingArea!)
        }
    }
    
    func configureData(article:Article) {
       titleTextView.stringValue = article.title!
       sourceTextView.stringValue = article.source!
       let createDate = NSDate(timeIntervalSince1970: article.createDate)
       dateTextView.stringValue = formatDate(createDate)
    }
    
    override func mouseEntered(theEvent: NSEvent) {
        wrapView.wantsLayer = true
        wrapView.layer?.backgroundColor  = NSColor.sm_highlightColor().CGColor
    }
    
    override func mouseExited(theEvent: NSEvent) {
        
        wrapView.layer?.backgroundColor = NSColor.sm_whiteColor().CGColor

    }
}
