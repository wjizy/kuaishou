//
//  ApiHome.swift
//  kuaishou
//
//  Created by 锦锋 on 2017/10/29.
//  Copyright © 2017年 jinfeng. All rights reserved.
//

import UIKit

class ApiHome: BaseApi {

   class func GET<T:Decodable>(url:String, pamaram:Dictionary<String, Any>, success:@escaping Success, fail:@escaping Failture, modelClass:T.Type) -> Void{
    self.baseGet(url: url, pamaram: pamaram, success: success, fail: fail, modelClass: modelClass)
    }
    
    class func POST<T:Decodable>(url:String, pamaram:Dictionary<String, Any>, success:@escaping Success, fail:@escaping Failture, modelClass:T.Type) -> Void{
        self.basePost(url: url, pamaram: pamaram, success: success, fail: fail, modelClass: modelClass)
    }
}
