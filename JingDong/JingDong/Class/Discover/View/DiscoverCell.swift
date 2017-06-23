//
//  DiscoverCell.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/15.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class DiscoverCell: UITableViewCell {

    let originXY:CGFloat = 10.0
    let heightTitle:CGFloat = 40.0
    let heightLabel:CGFloat = 20.0
    let sizeImage:CGFloat = 20.0
    
    var productImageView:UIImageView?
    var productTitleLabel:UILabel?
    var productReadLabel:UILabel?
    var productNumberLabel:UILabel?
    var authorImageView:UIImageView?
    var authorNameLabel:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.whiteColor()
        self.width = kScreenWitdh
        
        self.setUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI()
    {
        
    }
    
    // MARK: - 方法
    
    /// cell高度
    class func heightForCell() -> CGFloat
    {
        return 0.0
    }
    
    /// 刷新cell数据
    func reloadDataWithModel(model data:DiscoverModel)
    {
        
    }
}
