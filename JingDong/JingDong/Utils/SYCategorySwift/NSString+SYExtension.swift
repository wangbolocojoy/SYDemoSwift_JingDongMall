//
//  NSString+SYExtension.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/16.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

extension NSString {

    /// 计算字符宽高
    public func textSize(size maxsize:CGSize, font:UIFont) -> CGSize
    {
        let size:CGSize = self.boundingRectWithSize(maxsize, options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil).size
        return size
    }
}
