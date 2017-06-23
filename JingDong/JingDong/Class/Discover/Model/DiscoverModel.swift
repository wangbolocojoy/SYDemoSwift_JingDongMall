//
//  DiscoverModel.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/15.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class DiscoverModel: NSObject {

    /// cell类型（1large，2mid，3litter）
    var productType:Int!
    
    /// 标题
    var productTitle:String!
    /// 阅读量
    var productRead:Int = 0
    /// 图片
    var productImages:[String]!
    /// 件数
    var productNumber:Int = 0
    
    /// 作者头像
    var productAuthorImage:String!
    /// 作者昵称
    var productAuthorName:String!
}
