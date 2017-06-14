//
//  CategoryDetailImageHeader.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/14.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

let reuseIdentifierCategoryDetailImageHeader = "CategoryDetailImageHeader"
let heightCategoryDetailImageHeader:CGFloat = (10.0 + 120.0 + 10.0 + 30.0)

class CategoryDetailImageHeader: UICollectionReusableView {
    
    var imageView:UIImageView!
    var titleLabel:UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        
        self.width = widthCategoryDetailView
        self.height = heightCategoryDetailImageHeader
        
        self.setUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI()
    {
        self.imageView = UIImageView(frame: CGRectMake(0.0, 10.0, self.width, 120.0))
        self.addSubview(self.imageView)
        self.imageView.clipsToBounds = true
        self.imageView.backgroundColor = UIColor.lightGrayColor()
        
        self.titleLabel = UILabel(frame: CGRectMake(0.0, (self.imageView.bottom + 10.0), self.width, 30.0))
        self.addSubview(self.titleLabel)
        self.titleLabel.textAlignment = .Left
        self.titleLabel.textColor = UIColor.blackColor()
        self.titleLabel.font = UIFont.systemFontOfSize(12.0)
        self.titleLabel.backgroundColor = UIColor.clearColor()
    }
}
