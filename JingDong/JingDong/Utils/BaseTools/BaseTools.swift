//
//  BaseTools.swift
//  zhangshaoyu
//
//  Created by zhangshaoyu on 17/5/15.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class BaseTools: NSObject {

    
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
    
    // MARK: - 文件目录
    
    /// home沙盒主目录路径
    class func FilePathHome() -> String
    {
        return NSHomeDirectory();
    }
    
    /// temp临时目录
    class func FilePathTemp() -> String
    {
        return NSTemporaryDirectory();
    }
    
    /// document文档目录
    class func FilePathDecument() -> String
    {
        let array = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true);
        let path = array.first!;
        return path;
    }
    
    /// cache缓存目录
    class func FilePathCache() -> String
    {
        let array = NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true);
        let path = array.first!;
        return path;
    }
    
    /// library目录
    class func FilePathLibrary() -> String
    {
        let array = NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true);
        let path = array.first!;
        return path;
    }
    
    /// home主目录自定义文件路径
    class func FilePathHomeWithName(name:String) -> String
    {
        var path = BaseTools.FilePathHome() as NSString
        path = path.stringByAppendingPathComponent(name)
        return path as String
    }
    
    /// temp临时目录自定义文件路径
    class func FilePathTempWithName(name:String) -> String
    {
        var path = BaseTools.FilePathTemp() as NSString
        path = path.stringByAppendingPathComponent(name)
        return path as String
    }
    
    /// document文档目录自定义文件路径
    class func FilePathDocumentWithName(name:String) -> String
    {
        var path = BaseTools.FilePathDecument() as NSString
        path = path.stringByAppendingPathComponent(name)
        return path as String
    }
    
    /// cache缓存目录自定义文件路径
    class func FilePathCacheWithName(name:String) -> String
    {
        var path = BaseTools.FilePathCache() as NSString
        path = path.stringByAppendingPathComponent(name)
        return path as String
    }
    
    /// library目录自定义文件路径
    class func FilePathLibraryWithName(name:String) -> String
    {
        var path = BaseTools.FilePathLibrary() as NSString
        path = path.stringByAppendingPathComponent(name)
        return path as String
    }
    
}


