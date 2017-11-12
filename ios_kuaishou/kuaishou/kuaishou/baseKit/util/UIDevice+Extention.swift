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
    /// 获取系统的版本
    class func systemVersion() -> Double {
        let version = Double(UIDevice.current.systemVersion)
        return version!
    }
        
    /// 是否是ipad
    class func isPad() -> Bool {
        let pad = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad
        return pad
    }
    
    /// 是否是iPhone
    class func isPhone() -> Bool {
        let phone = UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone
        return phone
    }
    
    /// 是否是模拟器
    class func isSimulator() -> Bool {
        #if TARGET_OS_SIMULATOR
            return true
        #else
            return false
        #endif
    }
    
    /// 检测是否可以打电话
    class func canMakePhoneCalls() -> Bool {
        let can = UIApplication.shared.canOpenURL(URL.init(string: "tel://")!)
        return can
    }
}
