//
//  UIView+SYExtension.swift
//  zhangshaoyu
//
//  Created by zhangshaoyu on 17/5/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

extension UIView
{
    // MARK : 坐标尺寸
    
    var origin:CGPoint {
        get {
            return self.frame.origin
        }
        set(newValue) {
            var rect = self.frame
            rect.origin = newValue
            self.frame = rect
        }
    }
    
    var size:CGSize {
        get {
            return self.frame.size
        }
        set(newValue) {
            var rect = self.frame
            rect.size = newValue
            self.frame = rect
        }
    }
    
    var left:CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.x = newValue
            self.frame = rect
        }
    }
    
    var top:CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.y = newValue
            self.frame = rect
        }
    }
    
    var right:CGFloat {
        get {
            return (self.frame.origin.x + self.frame.size.width)
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.x = (newValue - self.frame.size.width)
            self.frame = rect
        }
    }
    
    var bottom:CGFloat {
        get {
            return (self.frame.origin.y + self.frame.size.height)
        }
        set(newValue) {
            var rect = self.frame
            rect.origin.y = (newValue - self.frame.size.height)
            self.frame = rect
        }
    }
    
    // MARK: - 宽高
    
    var width:CGFloat {
        get {
            return self.frame.width
        }
        set(newValue) {
            var rect = self.frame
            rect.size.width = newValue
            self.frame = rect
        }
    }
    
    var height:CGFloat {
        get {
            return self.frame.height
        }
        set(newValue) {
            var rect = self.frame
            rect.size.height = newValue
            self.frame = rect
        }
    }
    
    // MARK: - 位移
    
    // 移动到指定中心点位置
    func moveToPoint(point:CGPoint) -> Void
    {
        var center = self.center
        center.x = point.x
        center.y = point.y
        self.center = center
    }
    
    // 缩放到指定大小
    func scaleToSize(scale:CGFloat) -> Void
    {
        var rect = self.frame
        rect.size.width *= scale
        rect.size.height *= scale
        self.frame = rect
    }
    
    // MARK: - 毛玻璃效果
    
    // 毛玻璃
    func effectViewWithAlpha(alpha:CGFloat) -> Void
    {
        let effect = UIBlurEffect.init(style: UIBlurEffectStyle.Light)
        let effectView = UIVisualEffectView.init(effect: effect)
        effectView.frame = self.bounds
        effectView.alpha = alpha
        
        self.addSubview(effectView)
    }
    
    // MARK: - 边框属性
    
    // 圆角设置
    func viewRadius(radius radius:CGFloat) -> Void
    {
        if (0.0 < radius)
        {
            self.layer.cornerRadius = radius
            self.layer.masksToBounds = true
            self.clipsToBounds = true
        }
    }
    
    // 边框设置
    func viewBorder(lineWidth borderWidth:CGFloat, lineColor:UIColor) -> Void
    {
        if (0.0 < borderWidth)
        {
            self.layer.borderWidth = borderWidth
            self.layer.borderColor = lineColor.CGColor
        }
    }
    
    // MARK: - 翻转
    
    // 旋转 旋转180度 M_PI
    func viewTransformWithRotation(rotation:CGFloat) -> Void
    {
        self.transform = CGAffineTransformMakeRotation(rotation);
    }
    
    // 缩放
    func viewScaleWithSize(size:CGFloat) -> Void
    {
        self.transform = CGAffineTransformScale(self.transform, size, size);
    }
    
    // 水平，或垂直翻转
    func viewFlip(isHorizontal:Bool) -> Void
    {
        if (isHorizontal)
        {
            // 水平
            self.transform = CGAffineTransformScale(self.transform, -1.0, 1.0);
        }
        else
        {
            // 垂直
            self.transform = CGAffineTransformScale(self.transform, 1.0, -1.0);
        }
    }
    
}
