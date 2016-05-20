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

    
    func loadData(maxId:Int,isPullRefresh:Bool) {
        if self.loading {
            return
        }
        self.loading = true
        
        Alamofire.request(Router.ArticleList(maxId: maxId, count: 12)).responseJSON {
            res in
            self.loading = false
            
            let json = res.result.value
            let result = JSON(json!)
            
            print(result);
        
        }
        
    }
}
