//
//  DiscoverTable.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/15.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class DiscoverTable: UITableView, UITableViewDataSource, UITableViewDelegate {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var datas:NSArray!
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.backgroundColor = UIColor.whiteColor()
        self.separatorStyle = .None
        
        self.dataSource = self
        self.delegate = self
        
        self.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.registerClass(DiscoverLargeCell.self, forCellReuseIdentifier: reuseDiscoverLargeCell)
        self.registerClass(DiscoverMidCell.self, forCellReuseIdentifier: reuseDiscoverMidCell)
        self.registerClass(DiscoverLitterCell.self, forCellReuseIdentifier: reuseDiscoverLitterCell)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 视图
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height:CGFloat = 0.0
        let model:DiscoverModel = self.datas.objectAtIndex(indexPath.row) as! DiscoverModel
        if model.productType == 1
        {
            height = DiscoverLargeCell.heightForCell()
        }
        else if model.productType == 2
        {
            height = DiscoverMidCell.heightForCell()
        }
        else if model.productType == 3
        {
            height = DiscoverLitterCell.heightForCell()
        }
        
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let model:DiscoverModel = self.datas.objectAtIndex(indexPath.row) as! DiscoverModel
        if model.productType == 1
        {
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseDiscoverLargeCell) as! DiscoverLargeCell
            cell.reloadDataWithModel(model: model)
            return cell
        }
        else if model.productType == 2
        {
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseDiscoverMidCell) as! DiscoverMidCell
            cell.reloadDataWithModel(model: model)
            return cell
        }
        else if model.productType == 3
        {
            let cell = tableView.dequeueReusableCellWithIdentifier(reuseDiscoverLitterCell) as! DiscoverLitterCell
            cell.reloadDataWithModel(model: model)
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell")! as UITableViewCell
            return cell
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var height:CGFloat = 0.0
        let model:DiscoverModel = self.datas.objectAtIndex(indexPath.row) as! DiscoverModel
        if model.productType == 1
        {
            height = DiscoverLargeCell.heightForCell()
        }
        else if model.productType == 2
        {
            height = DiscoverMidCell.heightForCell()
        }
        else if model.productType == 3
        {
            height = DiscoverLitterCell.heightForCell()
        }
        print("height = \(height)")
    }
}
