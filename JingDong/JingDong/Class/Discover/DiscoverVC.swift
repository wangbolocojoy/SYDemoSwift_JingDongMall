//
//  DiscoverVC.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/5/12.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class DiscoverVC: BaseViewController {

    var buttonView:DiscoverButtonView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "觅";
        
        self.setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - 视图
    func setUI()
    {
        self.buttonView = DiscoverButtonView.init(frame: CGRectMake(0.0, 0.0, self.view.width, heightDiscoverButtonView))
        self.view.addSubview(self.buttonView)
        self.buttonView.titles = ["精选", "直播", "关注", "视频购", "社区", "好东西", "生活", "数码", "亲子", "风尚", "美食"];
        self.buttonView.reloadData()
    }

}
