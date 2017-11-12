//
//  HomeModel.swift
//  kuaishou
//
//  Created by 锦锋 on 2017/11/4.
//  Copyright © 2017年 jinfeng. All rights reserved.
//

import UIKit

class HomeModel: NSObject, Codable {

    var code:Int?
    var data:HomeData?
    
}

class HomeData: NSObject, Codable {
    
    var a:Int?
    
}
