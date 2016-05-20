//
//  PopoverViewController.swift
//  swiftmi
//
//  Created by yangyin on 16/5/16.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa

class PopoverViewController: NSViewController {

     
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var lastUpdated: NSTextField!
    var articles: [Article]!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    
    
}

// MARK: - NSTableViewDataSource
extension PopoverViewController: NSTableViewDataSource {
    func numberOfRowsInTableView(aTableView: NSTableView) -> Int {
        return articles.count
    }
    
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: tableView) as! TBCell
        return cellView
    }
    
}

extension PopoverViewController: NSTableViewDelegate {
    func tableViewSelectionDidChange(notification: NSNotification) {
        let table = notification.object as! NSTableView
    }
    
}

