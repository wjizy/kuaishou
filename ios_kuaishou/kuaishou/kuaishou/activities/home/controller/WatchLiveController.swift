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
        
        let player = IJKFFMoviePlayerController.init(contentURLString: "rtmp://101.132.175.177:1935/myapp/test", with: nil)
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
