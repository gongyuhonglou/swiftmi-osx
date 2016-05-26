//
//  PopoverViewController.swift
//  swiftmi
//
//  Created by yangyin on 16/5/16.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa
import SwiftyTimer
import SwiftDate

class PopoverViewController: NSViewController {

     
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var lastUpdated: NSTextField!
    var articles: [Article] = [Article]()
    var articleServices = ArticleServices()

    private var reloadDataTimer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.tableView.setDataSource(self)
        self.tableView.setDelegate(self)
        
        loadData();
    }
    
    override func viewWillAppear() {
        //self.tableView.reloadData()
        super.viewWillAppear()
        reloadDataTimer = NSTimer.every(15.seconds) {
            [weak self] in
            self?.loadData();
        }
    }
    
    @IBAction func toggleSettingButton(sender: NSView) {
        SMSettingsMenuAction.perform(sender)
        
    }
    override func viewWillDisappear() {
        super.viewWillDisappear()
        
        if let timer = reloadDataTimer {
            timer.invalidate()
        }
        
        reloadDataTimer = nil
    }
    
    func updateLastLabel() {
        
        let currentDate = NSDate()
        let time = currentDate.toString(DateFormat.Custom("YYYY-MM-dd HH:mm:ss"))
        lastUpdated.stringValue = "更新时间 \(time!)"
    }
    
    func loadData(maxId:Int = 0) {
        articleServices.loadData(maxId) {
            articles in
            if let items = articles {
                if maxId == 0 {
                    self.articles = items
                    for item in items.reverse() {
                        if !self.articles.contains({ (article:Article) -> Bool in
                            return article.articleId == item.articleId
                        }) {
                            
                          self.articles.insert(item, atIndex: 0)
                        }
                    }
                   
                } else {
                    self.articles.appendContentsOf(items)
                }
                self.tableView.reloadData()
                self.updateLastLabel()
            }
            
        }
    }
    
    
    
}

// MARK: - NSTableViewDataSource
extension PopoverViewController: NSTableViewDataSource {
    func numberOfRowsInTableView(aTableView: NSTableView) -> Int {
        return self.articles.count
    }
    
}

extension PopoverViewController: NSTableViewDelegate {
    func tableViewSelectionDidChange(notification: NSNotification) {
        let table = notification.object as! NSTableView
         NSWorkspace.sharedWorkspace().openURL(NSURL(string: self.articles[table.selectedRow].url)!)
    }
    
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        if self.articles.count - row < 3,let last = self.articles.last {
            loadData(last.articleId) ///load more
        }
        
        let cellView = tableView.makeViewWithIdentifier(tableColumn!.identifier, owner: tableView) as! TBCell
        cellView.configureData(self.articles[row])
        return cellView
    }
    
}

