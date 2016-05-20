//
//  Article.swift
//  swiftmi
//
//  Created by yangyin on 16/5/20.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa
import SwiftyJSON

class Article: NSObject {

    var title: String?
    var source: String?
    var createDate: Int64?
    var viewCount: Int64?
    
    class func mapping(json:JSON) -> Article{
        let article = Article()
        let createDate = json["createDate"].int64!
        let viewCount = json["viewCount"].int64!
        
        article.title = json["title"].stringValue
        article.source = json["source"].stringValue
        article.viewCount = createDate
        article.createDate = viewCount
        return article
    }
    
    
}
