//
//  HomeViewController.swift
//  kuaishou
//
//  Created by 锦锋 on 2017/10/26.
//  Copyright © 2017年 jinfeng. All rights reserved.
//

import UIKit

class HomeViewController: UIBasicController {
    
    @objc lazy var watchLiveButton:UIButton = {
        let button = UIButton.init(type: .custom)
        button.frame = CGRect.init(x: 20, y: 200, width: kScreenWidth - 40, height: 45)
        button.setTitle("观看直播", for: .normal)
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        self.view.addSubview(button);
        return button
    }()
    @objc lazy var liveButton:UIButton = {
        let button = UIButton.init(type: .custom)
        button.frame = CGRect.init(x: 20, y: 300, width: kScreenWidth - 40, height: 45)
        button.setTitle("我要直播", for: .normal)
        button.backgroundColor = UIColor.orange
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        self.view.addSubview(button);
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiHome.GET(url: "", pamaram: ["action":"get","id":"a","signature":"4fd904d924e15b30dfce49674124c139"], success: { (result) in
            let model = result as? HomeModel
            
            print("\(model?.code ?? -1) === \(model?.data?.a ?? -1)")
        }, fail: { (error) in
            
        }, modelClass: HomeModel.self)
        
        
        
        let uuid = UIDevice.getUUIDString()
        let date = Int(Date.timeIntervalBetween1970AndReferenceDate)
        let ID = uuid + String(date)
        let signature = kAppName + uuid
        
        
        let md5ID = ID.md5String()
        let md5Signature = signature.md5String()
        
        ApiHome.POST(url: "", pamaram: ["action":"set","id":md5ID,"signature":md5Signature], success: { (result) in
            let model = result as! LiveModel
            
            print("ok = \(model.code ?? -1) + \(model.data ?? -1)")
        }, fail: { (error) in
            print("error=====\(error)")
        }, modelClass: LiveModel.self)
        
        
        self.watchLiveButton.addTarget(self, action: #selector(watchLiveButtonClick), for: .touchUpInside)
        self.liveButton.addTarget(self, action: #selector(liveButtonClick), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc func watchLiveButtonClick(){
        let watchLiveVC = WatchLiveController()
        self.navigationController?.pushViewController(watchLiveVC, animated: true)
    }
    @objc func liveButtonClick(){
        let liveVC = LiveTelecastController()
        self.navigationController?.pushViewController(liveVC, animated: true)
    }

}
