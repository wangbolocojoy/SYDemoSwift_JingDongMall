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
        // 按钮视图
        self.buttonView = DiscoverButtonView.init(frame: CGRectMake(0.0, 0.0, self.view.width, heightDiscoverButtonView))
        self.view.addSubview(self.buttonView)
        self.buttonView.titles = ["精选", "直播", "关注", "视频购", "社区", "好东西", "生活", "数码", "亲子", "风尚", "美食"];
        self.buttonView.reloadData()
        
        let currentView = self.buttonView
        
        // 列表视图
        let discoverTable:DiscoverTable = DiscoverTable.init(frame: CGRectMake(0.0, currentView.bottom, currentView.width, (self.view.height - currentView.bottom)), style: .Plain)
        self.view.addSubview(discoverTable)
        discoverTable.autoresizingMask = .FlexibleHeight
        
        let images = ["http://p3.pstatp.com/origin/2a380005298092810b83","http://p3.pstatp.com/origin/24380005bb68b79db56b","http://p9.pstatp.com/origin/2a3b00019dfe68680090","http://p1.pstatp.com/origin/288f0001e60e3f4311cc","http://p3.pstatp.com/origin/2a3c0001a4c5a0ff857a","http://p3.pstatp.com/origin/26f200037ec99bf32bb2"]
        let titles = ["厨师被特许带剩菜回家 为烫伤儿攒手术费","一个人的村子","六岁小姐姐为弟弟烧柴做大锅饭，姐弟温暖亲情震撼网友，感慨万千","90后女孩嫁入深山，一个人撑起8口之家，看后让人想哭","父母在外打工，小姐妹俩看家，最爱吃“辣椒饭”","镜头下：深山里的两口之家"]
        let names:[String] = ["西楚朗雨","好色之徒","别人家的孩子真可爱","影像说事儿","村里的小孩","宠宠之爱"]
        let heads = ["http://p3.pstatp.com/large/97e0006b12aea43fcb2","http://p9.pstatp.com/large/d2a001760ebd1b84e89","http://p5a.pstatp.com/large/1bf500015bb467537084","http://p1.pstatp.com/large/249b00129014ea2b20c3","http://p10.pstatp.com/large/18a2000454211826546a","http://p2.pstatp.com/large/2b6002092249f94143a"]
        let array = NSMutableArray()
        for _ in 0...30
        {
            let model:DiscoverModel = DiscoverModel()
            model.productImages = images
            model.productTitle = titles[random() % titles.count]
            model.productNumber = random() % 1000 + 10
            model.productRead = random() % 1000 + 10
            let authorIndex = random() % heads.count
            model.productAuthorImage = heads[authorIndex]
            model.productAuthorName = names[authorIndex]
            model.productType = random() % 3 + 1
            
            array.addObject(model)
        }
        discoverTable.datas = array
        discoverTable.reloadData()
    }
    
    
    

}
