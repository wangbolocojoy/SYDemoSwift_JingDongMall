//
//  UIColor+SYExtension.swift
//  zhangshaoyu
//
//  Created by zhangshaoyu on 17/5/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

extension UIColor {
    
    // MARK: - 颜色
    
    /// 设置随机颜色
    class func colorRandom() -> UIColor
    {
        let color: UIColor = UIColor.init(red: (((CGFloat)((random() % 256)) / 255.0)), green: (((CGFloat)((random() % 256)) / 255.0)), blue: (((CGFloat)((random() % 256)) / 255.0)), alpha: 1.0);
        return color;
    }
    
    /// 设置颜色（RGB：0.0~255.0） 示例：UIColorRGB(100, 100, 100)
    class func colorRGB(R R:CGFloat, G:CGFloat, B:CGFloat) -> UIColor
    {
        return colorRGB_Alpha(R: R, G: G, B: B, alpha: 1.0);
    }
    
    /// 设置颜色与透明度（RGB：0.0~255.0；alpha：0.0~1.0） 示例：UIColorRGB_Alpha(100.0, 100.0, 20.0, 1.0)
    class func colorRGB_Alpha(R R:CGFloat, G:CGFloat, B:CGFloat, alpha:CGFloat) -> UIColor
    {
        let color = UIColor.init(red: (R / 255.0), green: (G / 255.0), blue: (B / 255.0), alpha: alpha);
        return color;
    }
    
    /// 设置颜色 示例：UIColorHex(0x26A7E8)
    class func colorHex(value:UInt32) -> UIColor
    {
        return colorHex_Alpha(value: value, alpha: 1.0);
    }
    
    /// 设置颜色与透明度 示例：UIColorHEX_Alpha(0x26A7E8, 0.5)
    class func colorHex_Alpha(value value:UInt32, alpha:CGFloat) -> UIColor
    {
        let color = UIColor.init(red: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), green: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), blue: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), alpha: alpha)
        return color
    }

}