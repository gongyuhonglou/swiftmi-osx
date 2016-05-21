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

    var articleId:Int!
    var title: String?
    var source: String?
    var createDate: Double!
    var viewCount: Int64?
    var url:String!
    
    class func mapping(json:JSON) -> Article{
        let article = Article()
        let createDate = json["createDate"].doubleValue
        let viewCount = json["viewCount"].int64!
        article.articleId = json["articleId"].intValue
        article.title = json["title"].stringValue
        article.source = json["sourceName"].stringValue
        article.viewCount = viewCount
        article.createDate = createDate
        article.url = ServiceApi.getArticlesShareDetail(article.articleId)
        return article
    }
    
    
}
