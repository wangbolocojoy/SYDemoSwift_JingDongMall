//
//  BaseTabBarController.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/5/12.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    var mainVC: MainVC!
    var categoryVC: CategoryVC!
    var discoverVC: DiscoverVC!
    var cartVC: CartVC!
    var mineVC: MineVC!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.setViewController();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setViewController()
    {
        // 主页
        self.mainVC = MainVC()
        let mainNav = UINavigationController(rootViewController: self.mainVC)
        // 分类
        self.categoryVC = CategoryVC()
        let categoryNav = UINavigationController(rootViewController: self.categoryVC)
        // 觅
        self.discoverVC = DiscoverVC()
        let discoverNav = UINavigationController(rootViewController: self.discoverVC)
        // 购物车
        self.cartVC = CartVC()
        let cartNav = UINavigationController(rootViewController: self.cartVC)
        // 我的
        self.mineVC = MineVC()
        let mineNav = UINavigationController(rootViewController: self.mineVC)
   
        // tabbarController
        self.tabBar.barTintColor = UIColor.whiteColor()
        // 注意：视图控制器超过5个时（不包含5）会自动生成一个more视图标签，用来控制第5、6、...以后的视图控制器。
        self.viewControllers = [mainNav, categoryNav, discoverNav, cartNav, mineNav]
        // 属性设置
        // 设置默认被选中视图控制器
        self.selectedIndex = 0;
        // 设置切换视图 tabBar 属性
        // 1 打开用户交互
        self.tabBar.userInteractionEnabled = true;
        // 2 设置背景颜色
        self.tabBar.backgroundColor = UIColor.whiteColor()
        // 3 设置背景图片
        self.tabBar.backgroundImage = UIImage(named: "")
        // 4 选中时的背景图片
        self.tabBar.selectionIndicatorImage = UIImage(named: "")
        
        // 设置标题，未选中状态图标，选中状态图标
        let barItem01 = UITabBarItem(title: "首页", image: UIImage(named: "tabImage_normal01"), selectedImage: UIImage(named: "tabImage_selected01"))
        mainVC.tabBarItem = barItem01
        let barItem02 = UITabBarItem(title: "分类", image: UIImage(named: "tabImage_normal02"), selectedImage: UIImage(named: "tabImage_selected02"))
        categoryVC.tabBarItem = barItem02
        let barItem03 = UITabBarItem(title: "觅Me", image: UIImage(named: "tabImage_normal03"), selectedImage: UIImage(named: "tabImage_selected03"))
        discoverVC.tabBarItem = barItem03
        let barItem04 = UITabBarItem(title: "购物车", image: UIImage(named: "tabImage_normal04"), selectedImage: UIImage(named: "tabImage_selected04"))
        cartVC.tabBarItem = barItem04
        let barItem05 = UITabBarItem(title: "我的", image: UIImage(named: "tabImage_normal05"), selectedImage: UIImage(named: "tabImage_selected05"))
        mineVC.tabBarItem = barItem05
        
        // 设置字体颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blackColor()], forState: UIControlState.Normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.redColor()], forState: UIControlState.Selected)
        // 设置字体大小
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont.systemFontOfSize(8.0)], forState: UIControlState.Normal)
        // 设置字体偏移
        UITabBarItem.appearance().titlePositionAdjustment = UIOffsetMake(0.0, -5.0)
        // 设置图标选中时颜色
        UITabBar.appearance().tintColor = UIColor.redColor()
    }

}
