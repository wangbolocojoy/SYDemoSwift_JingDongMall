//
//  DiscoverButtonView.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/15.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

let widthDiscoverButtonView = kScreenWitdh
let heightDiscoverButtonView:CGFloat = 44.0

class DiscoverButtonView: UIView, UIScrollViewDelegate {

    var titles:NSArray!
    
    private let originXY:CGFloat = 20.0
    private var titleView:UIScrollView!
    private var button:UIButton!
    
    private var titleLine:UIView!
    private var previousButton:UIButton!
    private var previousOffX:CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.width = widthDiscoverButtonView
        self.height = heightDiscoverButtonView
        
        self.backgroundColor = UIColor.whiteColor()
        
        self.setUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 视图
    func setUI()
    {
        // 标题视图
        self.titleView = UIScrollView.init(frame: CGRectMake(0.0, 0.0, (self.width - self.height), self.height))
        self.addSubview(self.titleView)
        self.titleView.showsHorizontalScrollIndicator = false
        self.titleView.delegate = self
        
        let currentView = self.titleView
        
        // 按钮
        self.button = UIButton(frame: CGRectMake(currentView.right, currentView.top, currentView.height, currentView.height))
        self.addSubview(self.button)
        self.button.setImage(UIImage.imageWithName("down_normal"), forState: .Normal)
        self.button.setImage(UIImage.imageWithName("down_highlight"), forState: .Highlighted)
        self.button.addTarget(self, action: Selector("showModalView"), forControlEvents: .TouchUpInside)
        
        // 分割线
        let lineView = UIView(frame: CGRectMake(0.0, (self.height - 0.5), self.width, 0.5))
        lineView.backgroundColor = UIColor.lightGrayColor()
        self.addSubview(lineView)
    }
    
    // MARK: - 响应
    func showModalView()
    {
        
    }
    
    func reloadData()
    {
        var sizeWidth:CGFloat = originXY
        
        for index in 0..<self.titles.count
        {
            let title = self.titles[index] as! String

            // 字符实际长度
            let titleWidth:CGFloat = (title as NSString).textSize(size: CGSizeMake(kScreenWitdh, self.height), font: UIFont.systemFontOfSize(13.0)).width
            
            let button = UIButton.init(frame: CGRectMake(sizeWidth, 0.0, titleWidth, self.height))
            self.titleView.addSubview(button)
            button.backgroundColor = UIColor.clearColor()
            button.titleLabel?.font = UIFont.systemFontOfSize(13.0)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.setTitleColor(UIColor.redColor(), forState: .Selected)
            button.setTitle(title, forState: .Normal)
            button.tag = 1000 + index
            button.addTarget(self, action: Selector("buttonClick:"), forControlEvents: .TouchUpInside)
            
            sizeWidth += titleWidth + originXY
        }
        
        self.titleView.contentSize = CGSizeMake(sizeWidth, self.height)
        
        // 移动线
        self.titleLine = UIView.init(frame: CGRectMake(originXY, (self.titleView.height - 3.0), 0.0, 3.0))
        self.titleView.addSubview(self.titleLine)
        self.titleLine.backgroundColor = UIColor.redColor()
        
        // 初始化
        let button:UIButton = self.titleView.viewWithTag(1000) as! UIButton
        self.buttonClick(button)
    }
    
    func buttonClick(button:UIButton)
    {
        //
        self.titleLine.width = button.width
        UIView.animateWithDuration(0.3) { () -> Void in
            self.titleLine.left = button.left
        }
        if (button.right > (self.titleView.width + self.previousOffX))
        {
            self.titleView.setContentOffset(CGPointMake(((button.right + originXY) - self.titleView.width), 0.0), animated: true)
            self.previousOffX = ((button.right + originXY) - self.titleView.width)
        }
        else if (button.left < self.previousOffX)
        {
            var pointX:CGFloat = (self.previousOffX - button.left - originXY)
            if (button.right + originXY < self.titleView.width)
            {
                pointX = 0.0
            }
            self.titleView.setContentOffset(CGPointMake(pointX, 0.0), animated: true)
            self.previousOffX = pointX
        }
        
        //
        if (self.previousButton != nil)
        {
            self.previousButton.selected = false
        }
        button.selected = !button.selected
        self.previousButton = button
        
        let index = button.tag - 1000;
        print("click index = \(index)")
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.previousOffX = scrollView.contentOffset.x
        
        print(self.previousOffX)
    }

}
