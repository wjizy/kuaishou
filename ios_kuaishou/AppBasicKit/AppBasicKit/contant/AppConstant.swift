//
//  AppConstant.swift
//  AppBasicKit
//
//  Created by 锦锋 on 2017/10/26.
//  Copyright © 2017年 jinfeng. All rights reserved.
//

import Foundation
import UIKit

/// 当前版本号
public let kCurrentVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
/// 当前小版本号
public let kSandBoxVersion = UserDefaults.standard.object(forKey: "CFBundleShortVersionString") as? String ?? ""
/// 屏幕大小
public let kScreen = UIScreen.main.bounds
/// 屏幕宽度
public let kScreenWidth = UIScreen.main.bounds.size.width
/// 屏幕高度
public let kScreenHeight = UIScreen.main.bounds.size.height



/// 导航栏的高度
public let kAppNavigationHeight:CGFloat = 64.0
/// tabbar的高度
public let kAppTabbarHeight:CGFloat = 49.0
/// statueBar的高度
public let kStatueBarHeight:CGFloat = 20.0
/// 屏幕的倍数
public let kAppScale = UIScreen.main.scale
/// 一个像素宽度  常用作分割线
public let kCutLineWidth:CGFloat = 1.0 / kAppScale




/// 自定义Log
///
/// - Parameters:
///   - messsage: 正常输出内容
///   - file: 文件名
///   - funcName: 方法名
///   - lineNum: 行数
public func DLog<T>(_ messsage: T, file: String = #file, funcName: String = #function, lineNum: Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("\(fileName):(\(lineNum))======>>>>>>\n\(messsage)")
    #endif
}


