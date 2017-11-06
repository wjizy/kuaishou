//
//  UIDevice+Extention.swift
//  AppBasicKit
//
//  Created by 锦锋 on 2017/11/5.
//  Copyright © 2017年 jinfeng. All rights reserved.
//

import Foundation

extension UIDevice{
    /// 获取UUID
   class func getUUIDString() -> String {
        let uuidRef = CFUUIDCreate(kCFAllocatorDefault)
        let stringRef = CFUUIDCreateString(kCFAllocatorDefault, uuidRef)
        let uuidString = (stringRef! as String).replacingOccurrences(of: "-", with: "")
        return uuidString
    }
    
    
    
}
