//
//  MainVC.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/5/12.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class MainVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "首页";
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "test", style: .Done, target: self, action: Selector("test"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func test()
    {
        let nextVC = TestViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }

}
