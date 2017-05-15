//
//  CommonDefine.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/5/15.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import Foundation
import UIKit

let kScreenWitdh = UIScreen.mainScreen().bounds.width
let kScreenHeight = UIScreen.mainScreen().bounds.height

func GetScreenWidth() -> CGFloat
{
    let width = UIScreen.mainScreen().bounds.width
    return width
}

func GetScreenHeight() -> CGFloat
{
    let height = UIScreen.mainScreen().bounds.height
    return height
}

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

let kDateFormatDefault             = "yyyy-MM-dd HH:mm:ss";
let kDateFormat_yyMdHm             = "yy-MM-dd HH:mm";
let kDateFormat_yyyyMdHm           = "yyyy-MM-dd HH:mm";
let kDateFormat_yMd                = "yyyy-MM-dd";
let kDateFormat_MdHms              = "MM-dd HH:mm:ss";
let kDateFormat_MdHm               = "MM-dd HH:mm";
let kDateFormat_Hms                = "HH:mm:ss";
let kDateFormat_Hm                 = "HH:mm";
let kDateFormat_Md                 = "MM-dd";
let kDateFormat_yyMd               = "yy-MM-dd";
let kDateFormat_YYMMdd             = "yyyyMMdd";
let kDateFormat_yyyyMdHms          = "yyyyMMddHHmmss";
let kDateFormat_yyyyMdHmsS         = "yyyy-MM-dd HH:mm:ss.SSS";
let kDateFormat_yyyyMMddHHmmssSSS  = "yyyyMMddHHmmssSSS";
let kDateFormat_yMdWithSlash       = "yyyy/MM/dd";
let kDateFormat_yM                 = "yyyy-MM";
let kDateFormat_yMdChangeSeparator = "yyyy.MM.dd";


