//
//  DiscoverLitterCell.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/23.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

let reuseDiscoverLitterCell:String = "DiscoverLitterCell"
let sizeImageView:CGFloat = CGFloat((kScreenWitdh - 10.0 * 4) / 3)
let tagImageView:NSInteger = 1000

class DiscoverLitterCell: DiscoverCell {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var imageView01:UIImageView!
    var imageView02:UIImageView!
    var imageView03:UIImageView!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.height = DiscoverLitterCell.heightForCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 视图
    override func setUI()
    {
        self.productTitleLabel = UILabel(frame: CGRectMake(originXY, originXY, (self.width - originXY * 2), heightTitle))
        self.contentView.addSubview(self.productTitleLabel!)
        self.productTitleLabel!.font = UIFont.systemFontOfSize(14.0)
        self.productTitleLabel!.textColor = UIColor.blackColor()
        self.productTitleLabel!.textAlignment = .Left
        self.productTitleLabel!.numberOfLines = 2;
     
        var currentView:UIView  = self.productTitleLabel!
        
        let backImageView = UIView(frame: CGRectMake(currentView.left, currentView.bottom, currentView.width, sizeImageView))
        self.contentView.addSubview(backImageView)
        backImageView.backgroundColor = UIColor.clearColor()
        //
        self.imageView01 = UIImageView(frame: CGRectMake(0.0, 0.0, sizeImageView, sizeImageView))
        backImageView.addSubview(self.imageView01)
        self.imageView01.backgroundColor = UIColor.clearColor()
        self.imageView01.clipsToBounds = true
        self.imageView01.contentMode = .ScaleAspectFill
        self.imageView01.tag = (tagImageView + 0)
        self.imageView02 = UIImageView(frame: CGRectMake((self.imageView01.right + originXY), 0.0, sizeImageView, sizeImageView))
        backImageView.addSubview(self.imageView02)
        self.imageView02.backgroundColor = UIColor.clearColor()
        self.imageView02.clipsToBounds = true
        self.imageView02.contentMode = .ScaleAspectFill
        self.imageView02.tag = (tagImageView + 1)
        self.imageView03 = UIImageView(frame: CGRectMake((self.imageView02.right + originXY), 0.0, sizeImageView, sizeImageView))
        backImageView.addSubview(self.imageView03)
        self.imageView03.backgroundColor = UIColor.clearColor()
        self.imageView03.clipsToBounds = true
        self.imageView03.contentMode = .ScaleAspectFill
        self.imageView03.tag = (tagImageView + 2)
        
        currentView = backImageView
        
        self.authorImageView = UIImageView(frame: CGRectMake(currentView.left, (currentView.bottom + originXY / 2), sizeImage, sizeImage))
        self.contentView.addSubview(self.authorImageView!)
        self.authorImageView!.viewRadius(radius: sizeImage / 2)
        
        currentView = self.authorImageView!
        
        self.authorNameLabel = UILabel(frame: CGRectMake((currentView.right + originXY / 2), currentView.top, 100.0, currentView.height))
        self.contentView.addSubview(self.authorNameLabel!)
        self.authorNameLabel!.font = UIFont.systemFontOfSize(10.0)
        self.authorNameLabel!.textColor = UIColor.lightGrayColor()
        self.authorNameLabel!.textAlignment = .Left
        
        currentView = self.authorNameLabel!
        
        self.productReadLabel = UILabel(frame: CGRectMake((currentView.right + originXY / 2), currentView.top, 100.0, currentView.height))
        self.contentView.addSubview(self.productReadLabel!)
        self.productReadLabel!.font = UIFont.systemFontOfSize(10.0)
        self.productReadLabel!.textColor = UIColor.lightGrayColor()
        self.productReadLabel!.textAlignment = .Left
        
        currentView = self.productReadLabel!
        
        self.productNumberLabel = UILabel(frame: CGRectMake((self.width - 100.0 - originXY), currentView.top, 100.0, currentView.height))
        self.contentView.addSubview(self.productNumberLabel!)
        self.productNumberLabel!.font = UIFont.systemFontOfSize(10.0)
        self.productNumberLabel!.textColor = UIColor.lightGrayColor()
        self.productNumberLabel!.textAlignment = .Right
        
        currentView = self.productNumberLabel!
        
        let lineView = UIImageView(frame: CGRectMake(0.0, (currentView.bottom + originXY - 0.5), self.width, 0.5))
        self.contentView.addSubview(lineView)
        lineView.image = UIImage.imageWithColor(UIColor.lightGrayColor())
    }
    
    /// cell高度
    override class func heightForCell() -> CGFloat
    {
        return (10.0 + 40.0 + sizeImageView + 10.0 / 2 + 20.0 + 10.0)
    }
    
    /// 刷新cell数据
    override func reloadDataWithModel(model data:DiscoverModel)
    {
        if let model:DiscoverModel = data
        {
            for index in 0..<3
            {
                let imageStr:String = model.productImages[random() % model.productImages.count]
                
                let imageViewTag:UIImageView = self.contentView.viewWithTag(tagImageView + index) as! UIImageView
                
                UIImage.imageCacheWithUrl(imageUrl: imageStr, complete: {
                    (image:UIImage) -> Void in
                    imageViewTag.image = image
                })
            }
    
            let title:String = model.productTitle
            self.productTitleLabel!.text = title
            
            let imageHeaderStr:String = model.productAuthorImage
            UIImage.imageCacheWithUrl(imageUrl: imageHeaderStr, complete: {
                (image:UIImage) -> Void in
                self.authorImageView!.image = image
            })
            
            let name:String = model.productAuthorName
            self.authorNameLabel!.text = name
            
            let read:String = String(" \(model.productRead)次阅读")
            self.productReadLabel!.text = read
            
            let number:String = String("\(model.productNumber)件宝贝")
            self.productNumberLabel!.text = number
            
            let widthName = name.textSize(size: CGSizeMake(100.0, heightLabel), font: self.authorNameLabel!.font).width
            self.authorNameLabel!.width = widthName
            
            let widthRead = read.textSize(size: CGSizeMake(100.0, heightLabel), font: self.productReadLabel!.font).width
            self.productReadLabel!.left = self.authorNameLabel!.right
            self.productReadLabel!.width = widthRead
        }
    }
}
