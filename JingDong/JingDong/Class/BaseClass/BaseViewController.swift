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
    

    // MARK: - 重写系统方法
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        
        print("\(self) 被释放了...")
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = UIColor.colorHex(0xedeeef);
        if (self.respondsToSelector(Selector("edgesForExtendedLayout")))
        {
            self.edgesForExtendedLayout = .None;
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        self.hidesBottomBarWhenPushed = true
        
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        if (self.isRootController())
        {
            self.hidesBottomBarWhenPushed = false;
        }
        else
        {
            self.hidesBottomBarWhenPushed = true;
        }
        
        super.viewWillDisappear(animated)
    }
    
    
    // MARK: - 个性化设置
    
    // 是否是根视图控制器
    func isRootController() -> Bool
    {
        let rootController = self.navigationController?.viewControllers.first
        let isRoot = rootController?.isEqual(self)
        return isRoot!
    }
    
    // 导航栏样式
    func setNavigationStyle()
    {
        if self.navigationController!.navigationBar.respondsToSelector(Selector("barTintColor"))
        {
            // 背景色
            self.navigationController!.navigationBar.barTintColor = UIColor.whiteColor()
            self.navigationController!.navigationBar.translucent = false
            self.navigationController!.navigationBar.tintColor = UIColor.blackColor()
            
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
    
    // MARK: - 自定义方法
    
    
    /// 返回上层视图响应
    func backPreviousController()
    {
        if (self.isRootController())
        {
            self.dismissViewControllerAnimated(true, completion: nil)
        }
        else
        {
            if (self.presentedViewController != nil)
            {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            else
            {
                self.navigationController?.popViewControllerAnimated(true)
            }
        }
    }
}
