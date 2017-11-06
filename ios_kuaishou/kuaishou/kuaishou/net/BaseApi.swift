//
//  BaseApi.swift
//  kuaishou
//
//  Created by 锦锋 on 2017/11/1.
//  Copyright © 2017年 jinfeng. All rights reserved.
//

/// base URL
let kBaseURL:String = "http://baidu.com"

import UIKit
import Alamofire

/// 请求失败
typealias Failture  = (_ error:String) -> Void
/// 请求成功
typealias Success = (_ result:AnyObject) -> Void

class BaseApi: NSObject {

    func baseGet(URL url:String, requestPamaram pamaram:Dictionary<String, Any>,modelClass class:AnyClass, success:@escaping Success,  failed fail:@escaping Failture) -> Void {
        let urlString = kBaseURL + url
        Alamofire.request(urlString, method: .get, parameters: pamaram, encoding: JSONEncoding.default, headers: nil).responseJSON { (respond) in
           
            if let json = respond.result.value{
                
                
                /// 将json转化为model
                let result = json
                
                let jsonData = try! JSONSerialization.data(withJSONObject: result, options: .prettyPrinted)
                let decode = JSONDecoder()
                do {
                    let employee = try decode.decode(HomeModel.self, from: jsonData)
                    print("解析成功:\(employee)")
                } catch  {
                    print("解析失败:\(error)")
                }
                
                success(result as AnyObject)
                
            }else{
                fail(respond.result.error as! String)
            }
        }
        
    }
    
    func basePost(URL url:String, requestPamaram pamaram:Dictionary<String, Any>,modelClass class:AnyClass, success:@escaping Success,  failed fail:@escaping Failture) -> Void {
        
    }
    

    
}
