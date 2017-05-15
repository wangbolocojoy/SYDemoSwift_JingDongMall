//
//  BaseViewController.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/5/12.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setNavigationStyle();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func loadView() {
        super.loadView()
        self.view.backgroundColor = BaseTools.UIColorHex(0xedeeef);
        if (self.respondsToSelector(Selector("edgesForExtendedLayout")))
        {
            self.edgesForExtendedLayout = .None;
        }
    }
    
    func setNavigationStyle()
    {
        if self.navigationController!.navigationBar.respondsToSelector(Selector("barTintColor"))
        {
            // 背景色
            self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
            self.navigationController!.navigationBar.translucent = false
            self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
            
            // 字体
            self.navigationController!.navigationBar.titleTextAttributes = [NSFontAttributeName:UIFont.systemFontOfSize(20.0), NSForegroundColorAttributeName:UIColor.blackColor()];
            
            // 导航底部1px的阴影颜色-修改
            /*
            self.navigationBar.shadowImage = UIImage(named: "")
            [self.navigationBar setShadowImage:kImageWithColor(kColorSeparatorline)];
            */
            
            // 导航底部1px的阴影-遮住
            let maskLayer = CAShapeLayer.init()
            maskLayer.backgroundColor = UIColor.redColor().CGColor;
            let maskRect = CGRectMake(0, -20.0, CGRectGetWidth(self.navigationController!.navigationBar.frame), (20.0 + CGRectGetHeight(self.navigationController!.navigationBar.frame)));
            maskLayer.path = CGPathCreateWithRect(maskRect, nil);
            self.navigationController!.navigationBar.layer.mask = maskLayer;
        }
    }
}
