 //
//  BaseApi.swift
//  kuaishou
//
//  Created by 锦锋 on 2017/11/1.
//  Copyright © 2017年 jinfeng. All rights reserved.
//

/// base URL
let kBaseURL:String = "http://101.132.175.177/?"
//http://101.132.175.177/?action=get&id=a&signature=4fd904d924e15b30dfce49674124c139
import UIKit
import Foundation

 enum TError {
    case notClassError
 }
 
/// 请求失败
typealias Failture  = (_ error:String) -> Void
/// 请求成功
typealias Success = (_ result:AnyObject) -> Void

class BaseApi: NSObject {

   /// GET请求
   ///
   /// - Parameters:
   ///   - url: 请求的地址
   ///   - pamaram: 参数
   ///   - success: 成功回调
   ///   - fail: 失败回调
   ///   - modelClass: 请求完成后的model
   class func baseGet<T:Decodable>(url:String, pamaram:Dictionary<String, Any>, success:@escaping Success, fail:@escaping Failture, modelClass:T.Type) -> Void {
        let paramaStr = getParamaString(pamaram)
        let urlString = kBaseURL + url + paramaStr!
        let requestURL = URL.init(string: urlString)
        let request = URLRequest.init(url: requestURL!)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request) { (data, respond, error) in
            if error == nil {
                let dataDecoder = JSONDecoder()
                do {
                    let model = try dataDecoder.decode(HomeModel.self, from: data!)
                    success(model)
                } catch let decoderError{
                    DLog("解析失败 \(decoderError)")
                }
            }else{
                fail((error?.localizedDescription)!)
            }
        }
    
        dataTask.resume()
    }
    
   /// POST请求
   ///
   /// - Parameters:
   ///   - url: 请求地址
   ///   - pamaram: 参数
   ///   - success: 成功回调
   ///   - fail: 失败回调
   ///   - modelClass: 请求完成转化的model
    class func basePost<T:Decodable>(url:String, pamaram:Dictionary<String, Any>, success:@escaping Success, fail:@escaping Failture, modelClass:T.Type){
    
    let urlString = kBaseURL + url
    let requestURL = URL.init(string: urlString)
    var request = URLRequest.init(url: requestURL!)
    request.httpMethod = "POST"
    request.httpBody = getPostData(pamaram)
    let session = URLSession.shared
    let dataTask = session.dataTask(with: request) { (data, respond, error) in
        if error == nil {
            let dataDecoder = JSONDecoder()
            do {
                let model = try dataDecoder.decode(modelClass, from: data!)
                  success(model as AnyObject)
            } catch let decoderError{
                DLog("解析失败 \(decoderError)")
            }
        }else{
            fail((error?.localizedDescription)!)
        }
    }
    
     dataTask.resume()
}
    
    /// 归档请求参数
    private class func getPostData(_ dic:Dictionary<String, Any>?) -> Data?{

        let paramaStr = getParamaString(dic)
        return paramaStr?.data(using: .utf8)
    }
    /// 参数转变为符合格式的字符串
    private class func getParamaString(_ dic:Dictionary<String,Any>?) -> String?{
        guard (dic?.count)! > 0 else {
            return nil
        }
        var paramaStr = ""
        
        for (key,value) in dic! {
            paramaStr = paramaStr + "\(key)" + "=" + "\(value)" + "&"
        }
        if paramaStr.characters.count > 0 {
            paramaStr.removeLast()
        }else{
            return nil
        }
        return paramaStr
    }
    
}
