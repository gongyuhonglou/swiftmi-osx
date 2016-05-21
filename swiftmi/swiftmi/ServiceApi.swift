//
//  ServiceApi.swift
//  swiftmi
//
//  Created by yangyin on 16/5/17.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa

class ServiceApi: NSObject {
    
    static var host:String = "http://www.swiftmi.com"
    
    class func getArticlesUrl(maxId:Int, count:Int) -> String {
        let url="\(host)/api/articles?maxId=\(maxId)&count=\(count)&withContent=0"
        return url
    }
    
    class func getArticlesShareDetail(articleId:Int) -> String {
        let url="\(host)/articles/\(articleId).html"
        return url
    }
    
     
}
