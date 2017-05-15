//
//  BaseTools.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/5/15.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class BaseTools: NSObject {

    // MARK: - 颜色
    
    /// 设置随机颜色
    class func UIColorRandom() -> UIColor
    {
        let color: UIColor = UIColor.init(red: (((CGFloat)((random() % 256)) / 255.0)), green: (((CGFloat)((random() % 256)) / 255.0)), blue: (((CGFloat)((random() % 256)) / 255.0)), alpha: 1.0);
        return color;
    }
    
    /// 设置颜色（RGB：0.0~255.0） 示例：UIColorRGB(100, 100, 100)
    class func UIColorRGB(R:CGFloat, G:CGFloat, B:CGFloat) -> UIColor
    {
        return UIColorRGB_Alpha(R, G: G, B: B, alpha: 1.0);
    }

    /// 设置颜色与透明度（RGB：0.0~255.0；alpha：0.0~1.0） 示例：UIColorRGB_Alpha(100.0, 100.0, 20.0, 1.0)
    class func UIColorRGB_Alpha(R:CGFloat, G:CGFloat, B:CGFloat, alpha:CGFloat) -> UIColor
    {
        let color = UIColor.init(red: (R / 255.0), green: (G / 255.0), blue: (B / 255.0), alpha: alpha);
        return color;
    }
    
    /// 设置颜色 示例：UIColorHex(0x26A7E8)
    class func UIColorHex(value:UInt32) -> UIColor
    {
        return UIColorHex_Alpha(value, alpha: 1.0);
    }
    
    /// 设置颜色与透明度 示例：UIColorHEX_Alpha(0x26A7E8, 0.5)
    class func UIColorHex_Alpha(value:UInt32, alpha:CGFloat) -> UIColor
    {
        let color = UIColor.init(red: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), green: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), blue: (((CGFloat)((value & 0xFF0000) >> 16)) / 255.0), alpha: alpha)
        return color
    }

    // MARK: - 字体
    
    /// 设置字体大小
    class func UIFontSize(size:CGFloat) -> UIFont
    {
        let font = UIFont.systemFontOfSize(size)
        return font
    }
    
    /// 设置粗字体大小
    class func UIFontBoldSize(size:CGFloat) -> UIFont
    {
        let font = UIFont.boldSystemFontOfSize(size)
        return font
    }
    
    // MARK: - 图片
    
    class func UIImageWithName(name:String) -> UIImage
    {
        let image: UIImage = UIImage(named: name)!
        return image
    }
    
    class func UIImageFromBundle(name:String, type:String) -> UIImage
    {
        let filePath:String = NSBundle.mainBundle().pathForResource(name, ofType: type)!
        let image: UIImage = UIImage(contentsOfFile: filePath)!
        return image
    }
    
    class func UIImageWithURL(url:String) -> UIImage
    {
        let url:NSURL = NSURL.fileURLWithPath(url)
        let data:NSData = NSData(contentsOfURL: url)!
        let image: UIImage = UIImage(data: data)!
        return image
    }
    
    class func UIImageUIEdgeWithName(name:String, edge:UIEdgeInsets) -> UIImage
    {
        var image = UIImage(named: name)
        image = image?.resizableImageWithCapInsets(edge, resizingMode: .Stretch)
        return image!
    }
    
    // MARK: - 时间格式
    
    enum TimeFormat:String
    {
        case format_default            = "yyyy-MM-dd HH:mm:ss"
        case format_yyMdHm             = "yy-MM-dd HH:mm"
        case format_yyyyMdHm           = "yyyy-MM-dd HH:mm"
        case format_yMd                = "yyyy-MM-dd"
        case format_MdHms              = "MM-dd HH:mm:ss"
        case format_MdHm               = "MM-dd HH:mm"
        case format_Hms                = "HH:mm:ss"
        case format_Hm                 = "HH:mm"
        case format_Md                 = "MM-dd"
        case format_yyMd               = "yy-MM-dd"
        case format_YYMMdd             = "yyyyMMdd"
        case format_yyyyMdHms          = "yyyyMMddHHmmss"
        case format_yyyyMdHmsS         = "yyyy-MM-dd HH:mm:ss.SSS"
        case format_yyyyMMddHHmmssSSS  = "yyyyMMddHHmmssSSS"
        case format_yMdWithSlash       = "yyyy/MM/dd"
        case format_yM                 = "yyyy-MM"
        case format_yMdChangeSeparator = "yyyy.MM.dd"
    }
    
    // MARK: -
}
