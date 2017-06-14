//
//  CategoryListCell.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/13.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import Foundation
import UIKit

let reuseIdentifierCategoryListCell = "CategoryListCell"
let widthCategoryListCell:CGFloat = 80.0;
let heightCategoryListCell:CGFloat = 50.0

class CategoryListCell: UITableViewCell {
    
    private var backView:UIView!
    private var titleLabel:UILabel!
    private var lineView:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    // MARK: - 实例化方法
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame = newFrame
            frame.size.width = widthCategoryListCell
            frame.size.height = heightCategoryListCell
            super.frame = frame
        }
    }
    
    init(reuseIdentifier cellID:String)
    {
        super.init(style: .Default, reuseIdentifier: cellID)
        
        self.setUI()
    }
    
    // MARK: - 视图
    
    func setUI()
    {
        self.backView = UIView(frame: self.bounds)
        self.contentView.addSubview(self.backView)
        self.backView.backgroundColor = UIColor.whiteColor()
        
        self.titleLabel = UILabel(frame: CGRectMake(0.0, 0.0, self.width, self.height))
        self.contentView.addSubview(self.titleLabel)
        self.titleLabel.backgroundColor = UIColor.clearColor()
        self.titleLabel.textAlignment = .Center
        self.titleLabel.textColor = UIColor.blackColor()
        self.titleLabel.font = UIFont.systemFontOfSize(13.0)
        
        self.lineView = UIView(frame: CGRectMake((self.width - 0.5), 0.0, 0.5, self.height))
        self.contentView.addSubview(self.lineView)
        self.lineView.backgroundColor = UIColor.lightGrayColor()
        
        let lineBottom = UIView(frame: CGRectMake(0.0, (self.height - 0.5), self.width, 0.5))
        self.contentView.addSubview(lineBottom)
        lineBottom.backgroundColor = UIColor.lightGrayColor()
    }
    
    // 数据
    
    func reloadUI(model data:CategoryModel)
    {
        self.titleLabel.text = data.title
        
        if (!data.selected)
        {
            self.lineView.hidden = false
            self.titleLabel.textColor = UIColor.blackColor()
            self.backView.backgroundColor = UIColor.whiteColor()
        }
        else
        {
            self.lineView.hidden = true
            self.titleLabel.textColor = UIColor.redColor()
            self.backView.backgroundColor = kBackgroundColor
        }
    }
}

