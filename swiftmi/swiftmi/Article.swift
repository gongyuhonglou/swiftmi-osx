//
//  Article.swift
//  swiftmi
//
//  Created by yangyin on 16/5/20.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa

class Article: NSObject {

    var Title: String
    var Source: String
    var CreateDate: NSDate
    
    
    init(title:String, source:String, createDate:NSDate) {
        self.Title = title;
        self.Source = source;
        self.CreateDate = createDate
    }
}
