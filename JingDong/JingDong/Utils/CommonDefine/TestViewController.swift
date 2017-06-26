//
//  TestViewController.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/5/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class TestViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "test";
        
        test()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func test()
    {
        print("当前设备是：\(isIPhone ? "iPhone" : "iPad")")
        print("当前版本号：\(GetAppCurrentVersion)")
        print("当前设备型号：\(isIPhone6P ? "iPhone6Plus" : (isIPhone6 ? "iPhone6" : (isIPhone5 ? "iPhone5" : "iPhone4")))")
        print("当前设备尺寸：宽\(kScreenWitdh), 高\(kScreenHeight)")
        
        
        let imageView = UIImageView.init(frame: CGRectMake(10.0, 10.0, 60.0, 60.0))
        self.view.addSubview(imageView)
        
//        imageView.image = UIImage(named: "header")
//        imageView.image = UIImage.imageWithName("header")
        imageView.image = UIImage.imageFromBundle(name: "header", type: "png")
        
        imageView.backgroundColor = UIColor.colorRandom()
        
        imageView.left = 100.0
        imageView.top = 100.0
        imageView.size = CGSizeMake(100.0, 100.0)

        imageView.moveToPoint(CGPointMake(100.0, 100.0))
        imageView.scaleToSize(2.0)

        imageView.effectViewWithAlpha(0.6)
        
        imageView.viewRadius(radius: 3.0)
        imageView.viewBorder(lineWidth: 1.0, lineColor: UIColor.redColor())
        
        imageView.viewFlip(false)
        
        imageView.viewTransformWithRotation(5.0)
    }

}
