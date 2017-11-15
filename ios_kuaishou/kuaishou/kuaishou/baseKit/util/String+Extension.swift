//
//  String+Extension.swift
//  AppBasicKit
//
//  Created by 锦锋 on 2017/10/27.
//  Copyright © 2017年 jinfeng. All rights reserved.
//

import Foundation

let kBufferLength = 16

extension String{
    
    /// MD5加密字符串
    func md5String() -> String {

        let cStr = (self as NSString).utf8String
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: kBufferLength)
        CC_MD5(cStr!,(CC_LONG)(strlen(cStr!)), buffer)
        let md5String = NSMutableString()
        for i in 0 ..< 16 {
            md5String.appendFormat("%02x", buffer[i])
        }
        free(buffer)
        return md5String as String
    }
    
    
    
}
