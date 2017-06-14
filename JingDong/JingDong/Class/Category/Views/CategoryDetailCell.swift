//
//  CategoryDetailCell.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/14.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

typealias itemClickBlock = () -> ()

let reuseIdentifierCategoryDetailCell = "CategoryDetailCell"
let widthCategoryDetailCell:CGFloat = (widthCategoryDetailView / 3)
let heightCategoryDetailCell:CGFloat = (80.0 + 20.0)

class CategoryDetailCell: UICollectionViewCell {
    
    private var imageView:UIImageView!
    private var titleLabel:UILabel!
    
    var itemClick = itemClickBlock?()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clearColor()
        
        self.width = widthCategoryDetailCell
        self.height = heightCategoryDetailCell
        
        self.setUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 视图
    
    func setUI()
    {
        let origin:CGFloat = 10.0
        
        let backView = UIView(frame: self.bounds)
        self.contentView.addSubview(backView)
        backView.backgroundColor = UIColor.whiteColor()
        
        self.imageView = UIImageView(frame: CGRectMake(origin, origin, (self.width - origin * 2), (self.height - 20.0 - 10.0)))
        backView.addSubview(self.imageView)
        self.imageView.backgroundColor = UIColor.clearColor()
        self.imageView.clipsToBounds = true
        self.imageView.contentMode = .ScaleAspectFill
        
        let currentView:UIView = self.imageView
        
        self.titleLabel = UILabel(frame: CGRectMake(origin, currentView.bottom, currentView.width, 20.0))
        backView.addSubview(self.titleLabel)
        self.titleLabel.backgroundColor = UIColor.clearColor()
        self.titleLabel.textColor = UIColor.blackColor()
        self.titleLabel.textAlignment = .Center
        self.titleLabel.font = UIFont.systemFontOfSize(11.0)
        
        let button = UIButton(frame: backView.bounds)
        backView.addSubview(button)
        button.setBackgroundImage(UIImage.imageWithColor(UIColor.clearColor()), forState: .Normal)
        button.setBackgroundImage(UIImage.imageWithColor(UIColor.colorHex_Alpha(value: 0x000000, alpha: 0.1)), forState: .Highlighted)
        button.addTarget(self, action: Selector("cellClick"), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    // MARK: - 响应
    func cellClick()
    {
        if (self.itemClick != nil)
        {
            self.itemClick!()
        }
    }
    
    // MARK: - 刷新数据 
    
    func reloadUI(model data:CategoryDetailModel)
    {
//        let image = data.categoryImage
        self.imageView.image = UIImage(named: "header");
        
        let name = data.categoryName
        self.titleLabel.text = name
    }
}
