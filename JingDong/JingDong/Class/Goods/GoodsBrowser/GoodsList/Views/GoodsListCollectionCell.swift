//
//  GoodsListCollectionCell.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/5/25.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

let reuseGoodsListCollectionCell = "GoodsListCollectionCell";
let originXYGoodsListCollectionCell:CGFloat = 10.0;
let widthGoodsListCollectionCell:CGFloat = ((kScreenWitdh - originXYGoodsListCollectionCell * 3) / 2);
let heightGoodsListCollectionCell:CGFloat = (160.0 + originXYGoodsListCollectionCell + originXYGoodsListCollectionCell);

// 定义一个闭包类型
// 格式: typealias 闭包名称 = (参数名称: 参数类型) -> 返回值类型
typealias ItemClick = () -> ()

class GoodsListCollectionCell: UICollectionViewCell {
    
    let heightImage:CGFloat = 100.0;
    let heightName:CGFloat = 40.0;
    let heightPrice:CGFloat = 20.0;
    
    var imageView:UIImageView!
    var nameLabel:UILabel!
    var priceLabel:UILabel!
    // 回调
    var itemClick:ItemClick!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor();
        self.setUI();
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 视图
    func setUI()
    {
        imageView = UIImageView.init(frame: CGRectMake(0.0, originXYGoodsListCollectionCell, widthGoodsListCollectionCell, heightImage));
        self.contentView.addSubview(imageView);
        imageView.contentMode = .ScaleAspectFit;
        
        var currentView:UIView = imageView;
        
        nameLabel = UILabel.init(frame: CGRectMake(originXYGoodsListCollectionCell / 2, currentView.bottom, (self.width - originXYGoodsListCollectionCell), heightName));
        self.contentView.addSubview(nameLabel);
        nameLabel.numberOfLines = 2;
        nameLabel.textAlignment = .Left;
        nameLabel.textColor = UIColor.blackColor();
        nameLabel.font = BaseTools.UIFontSize(13.0);
        
        currentView = nameLabel;
        
        priceLabel = UILabel.init(frame: CGRectMake(currentView.left, currentView.bottom, (currentView.width - originXYGoodsListCollectionCell - 50.0), heightPrice));
        self.contentView.addSubview(priceLabel);
        priceLabel.numberOfLines = 1;
        priceLabel.textAlignment = .Left;
        priceLabel.textColor = UIColor.redColor();
        priceLabel.font = BaseTools.UIFontSize(13.0);
        
        currentView = priceLabel;
        
        let button = UIButton.init(frame: CGRectMake(currentView.right, currentView.top, 50.0, currentView.height));
        self.contentView.addSubview(button);
        button.viewRadius(radius: 3.0)
        button.viewBorder(lineWidth: 0.5, lineColor: UIColor.lightGrayColor())
        button.setTitle("看相似", forState: .Normal);
        button.setTitleColor(UIColor.blackColor(), forState: .Normal);
        button.setTitleColor(UIColor.redColor(), forState: .Highlighted);
        button.titleLabel?.font = BaseTools.UIFontSize(12.0);
        button.addTarget(self, action: Selector("buttonClick"), forControlEvents: .TouchUpInside);
    }
    
    // MARK: - 响应
    func buttonClick()
    {
        if ((self.itemClick) != nil)
        {
            self.itemClick();
        }
    }
}
