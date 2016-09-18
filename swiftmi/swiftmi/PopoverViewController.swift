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

    fileprivate var reloadDataTimer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        loadData();
    }
    
    override func viewWillAppear() {
        //self.tableView.reloadData()
        super.viewWillAppear()
        reloadDataTimer = Timer.every(15.seconds) {
            [weak self] in
            self?.loadData();
        }
    }
    
    @IBAction func toggleSettingButton(_ sender: NSView) {
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
        
        let currentDate = Date()
        let time = currentDate.toString(format:DateFormat.custom("YYYY-MM-dd HH:mm:ss"))
        lastUpdated.stringValue = "更新时间 \(time!)"
    }
    
    func loadData(_ maxId:Int = 0) {
        articleServices.loadData(maxId) {
            articles in
            if let items = articles {
                if maxId == 0 {
                    self.articles = items
                    for item in items.reversed() {
                        if !self.articles.contains(where: { (article:Article) -> Bool in
                            return article.articleId == item.articleId
                        }) {
                            
                          self.articles.insert(item, at: 0)
                        }
                    }
                   
                } else {
                    self.articles.append(contentsOf: items)
                }
                self.tableView.reloadData()
                self.updateLastLabel()
            }
            
        }
    }
    
    
    
}

// MARK: - NSTableViewDataSource
extension PopoverViewController: NSTableViewDataSource {
    func numberOfRows(in aTableView: NSTableView) -> Int {
        return self.articles.count
    }
    
}

extension PopoverViewController: NSTableViewDelegate {
    func tableViewSelectionDidChange(_ notification: Notification) {
        let table = notification.object as! NSTableView
         NSWorkspace.shared().open(URL(string: self.articles[table.selectedRow].url)!)
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        if self.articles.count - row < 3,let last = self.articles.last {
            loadData(last.articleId) ///load more
        }
        
        let cellView = tableView.make(withIdentifier: tableColumn!.identifier, owner: tableView) as! TBCell
        cellView.configureData(self.articles[row])
        return cellView
    }
    
}

