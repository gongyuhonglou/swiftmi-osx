//
//  Router.swift
//  swiftmi
//
//  Created by yangyin on 16/5/17.
//  Copyright © 2016年 swiftmi. All rights reserved.
//

import Cocoa
import Alamofire


enum Router: URLRequestConvertible {
    
    static var token: String?
    
    //Restfull api
    case ArticleList(maxId:Int,count:Int)
    
    var method: Alamofire.Method {
        switch self {
        default:
            return .GET
        }
        
    }
    
    
    var path: String {
        switch self {
        case .ArticleList(let maxId,let count):
            return ServiceApi.getArticlesUrl(maxId, count: count)
        }
    }
    
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: path)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL)
        mutableURLRequest.HTTPMethod = method.rawValue
        
        if let token = Router.token {
            mutableURLRequest.setValue("\(token)", forHTTPHeaderField: "token")
        }
        
        mutableURLRequest.setValue("com.swiftmi.app", forHTTPHeaderField: "clientid")
        mutableURLRequest.setValue("2.0", forHTTPHeaderField: "appversion")
        mutableURLRequest.setValue("osx", forHTTPHeaderField: "apptype")

        
        switch self {
        default:
            return mutableURLRequest
        }
    }
}