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

    fileprivate var trackingArea: NSTrackingArea?
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    func formatDate(_ date:Date)->String {
        
        let fmt = DateFormatter()
        
        fmt.dateFormat = "yyyy-MM-dd"
        let dateString = fmt.string(from: date)
        return dateString
    }
    
    fileprivate func createTrackingAreaIfNeeded() {
        if trackingArea == nil {
            trackingArea = NSTrackingArea(rect: CGRect.zero, options: [NSTrackingAreaOptions.inVisibleRect, NSTrackingAreaOptions.mouseEnteredAndExited, NSTrackingAreaOptions.activeAlways], owner: self, userInfo: nil)
        }
    }
    
    override func updateTrackingAreas() {
        super.updateTrackingAreas()
        
        createTrackingAreaIfNeeded()
        
        if !trackingAreas.contains(trackingArea!) {
            addTrackingArea(trackingArea!)
        }
    }
    
    func configureData(_ article:Article) {
       titleTextView.stringValue = article.title!
       sourceTextView.stringValue = article.source!
       let createDate = Date(timeIntervalSince1970: article.createDate)
       dateTextView.stringValue = formatDate(createDate)
    }
    
    override func mouseEntered(with theEvent: NSEvent) {
        wrapView.wantsLayer = true
        wrapView.layer?.backgroundColor  = NSColor.sm_highlightColor().cgColor
    }
    
    override func mouseExited(with theEvent: NSEvent) {
        
        wrapView.layer?.backgroundColor = NSColor.sm_whiteColor().cgColor

    }
}
