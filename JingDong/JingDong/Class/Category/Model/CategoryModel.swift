//
//  CategoryModel.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/14.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class CategoryModel: NSObject {

    /// 标题
    var title:String!

    /// 状态
    var selected:Bool = false
}

class CategoryDetailModel: NSObject {
    // 标题
    var title:String?
    
    // 子类
    var categorys:NSArray?
    
    // 名称
    var categoryName:String?
    // 图标
    var categoryImage:String?
    //  id
    var categoryId:String?
}