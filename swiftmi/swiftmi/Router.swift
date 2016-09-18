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
    
    public func asURLRequest() throws -> URLRequest {
        return self.urlRequest
    }

    
    static var token: String?
    
    //Restfull api
    case articleList(maxId:Int,count:Int)
    
    var method: Alamofire.HTTPMethod {
        switch self {
        default:
            return .get
        }
        
    }
    
    
    var path: String {
        switch self {
        case .articleList(let maxId,let count):
            return ServiceApi.getArticlesUrl(maxId, count: count)
        }
    }
    
    
    var urlRequest: URLRequest {
        let url =  URL(string: path)!
        var mutableURLRequest = URLRequest(url: url)
        mutableURLRequest.httpMethod = method.rawValue

        
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
