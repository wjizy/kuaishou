//
//  WatchLiveController.swift
//  kuaishou
//
//  Created by 锦锋 on 2017/10/29.
//  Copyright © 2017年 jinfeng. All rights reserved.
//

import UIKit

class WatchLiveController: UIBasicController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        playMedia()
    }

    
    func playMedia() {
        self.view.backgroundColor = UIColor.white
//        rtmp://101.132.175.177:1935/myapp/test
//        http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1
//        http://qqpull.inke.cn/live/1510754958465637.flv?ikHost=tx&ikOp=0&codecInfo=8192
        let player = IJKFFMoviePlayerController.init(contentURLString: "rtmp://101.132.175.177:1935/myapp/test", with: IJKFFOptions.byDefault())
        player?.prepareToPlay()
        
        player?.view.frame = kScreen
        
        self.view.addSubview((player?.view)!)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
