//
//  CategoryDetailTitleHeader.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/14.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

let reuseIdentifierCategoryDetailTitleHeader = "CategoryDetailTitleHeader"
let heightCategoryDetailTitleHeader:CGFloat = 30.0

class CategoryDetailTitleHeader: UICollectionReusableView {
    
    var titleLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        
        self.width = widthCategoryDetailView
        self.height = heightCategoryDetailTitleHeader
        
        self.setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI()
    {
        self.titleLabel = UILabel(frame: self.bounds)
        self.addSubview(self.titleLabel)
        self.titleLabel.textAlignment = .Left
        self.titleLabel.textColor = UIColor.blackColor()
        self.titleLabel.font = UIFont.systemFontOfSize(12.0)
        self.titleLabel.backgroundColor = UIColor.clearColor()
    }

}
