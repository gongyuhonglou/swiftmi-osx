//
//  Articles.swift
//  swiftmi
//
//  Created by yangyin on 16/5/18.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa
import Alamofire
import SwiftyJSON

class ArticleServices: NSObject {
    
    var loading:Bool = false

    
    func loadData(_ maxId:Int,callback:@escaping ((_ articles:[Article]?) -> ())) {
        if self.loading {
            return
        }
        self.loading = true
        
        Alamofire.request(Router.articleList(maxId: maxId, count: 20)).responseJSON {
            res in
            self.loading = false
            
            let json = res.result.value
            let result = JSON(json!)
            
            guard let _ = result["isSuc"].bool else {
                return callback(nil)
            }
            
            var articles:[Article] = [Article]()
            let items = result["result"].arrayValue
            for item in items {
                let article = Article.mapping(item)
                articles.append(article)
            }
            callback(articles)
        }
        
    }
}
