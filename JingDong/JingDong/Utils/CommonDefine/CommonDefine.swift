//
//  CommonDefine.swift
//  zhangshaoyu
//
//  Created by zhangshaoyu on 17/5/15.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import Foundation
import UIKit

// MARK: - 设备信息

/// 当前app信息
let GetAppInfo = NSBundle.mainBundle().infoDictionary

/// 当前app版本号
let GetAppCurrentVersion = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString")

/// 获取设备系统号
let GetSystemVersion = UIDevice.currentDevice().systemVersion

/// iPhone设备
let isIPhone = (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone ? true : false)

/// iPad设备
let isIPad = (UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad ? true : false)

/// iPhone4设备
let isIPhone4 = (max(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.height) < 568.0 ? true : false)

/// iPhone5设备
let isIPhone5 = (max(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.height) == 568.0 ? true : false)

/// iPhone6设备
let isIPhone6 = (max(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.height) == 667.0 ? true : false)

/// iPhone6Plus设备
let isIPhone6P = (max(UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.height) == 736.0 ? true : false)

// MARK: - 尺寸信息

/// 全屏宽度
let kScreenWitdh = UIScreen.mainScreen().bounds.width
/// 全屏高度，不含状态栏高度
let kScreenHeight = UIScreen.mainScreen().bounds.height
/// 全屏高度，含状态栏高度
let kAllHeight = (UIScreen.mainScreen().applicationFrame.size.height + 20.0)
/// 视图控制器高度，不含导航栏控制器高度
let kBodyHeight = (UIScreen.mainScreen().applicationFrame.size.height - 44.0)

/// tabbar切换视图控制器高度
let kTabbarHeight = 49.0
/// 搜索视图高度
let kSearchBarHeight = 45.0
/// 状态栏高度
let kStatusBarHeight    = 20.0
/// 导航栏高度
let kNavigationHeight   = 44.0

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

// MARK: - 颜色
let kBackgroundColor = UIColor.colorHex(0xedeeef)




