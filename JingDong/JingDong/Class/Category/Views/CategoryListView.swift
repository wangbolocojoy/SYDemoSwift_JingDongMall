//
//  CategoryListView.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/13.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import Foundation
import UIKit

class CategoryListView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    var datas:NSArray!
    private var previousIndex:NSIndexPath!
    
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.backgroundColor = UIColor.clearColor()
        self.autoresizingMask = .FlexibleHeight
        self.separatorStyle = .None
        self.registerClass(CategoryListCell.self, forCellReuseIdentifier: reuseIdentifierCategoryListCell)
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datas.count;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return heightCategoryListCell
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cell = CategoryListCell.init(reuseIdentifier: reuseIdentifierCategoryListCell)
        let model = self.datas.objectAtIndex(indexPath.row) as! CategoryModel
        cell.reloadUI(model: model)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        // 上一个选中
        if (self.previousIndex != nil)
        {
            let previousModel = self.datas.objectAtIndex(self.previousIndex.row) as! CategoryModel
            previousModel.selected = false
            let previousCell = tableView.cellForRowAtIndexPath(self.previousIndex) as! CategoryListCell
            previousCell.reloadUI(model: previousModel)
        }
        // 当前选中
        let model = self.datas.objectAtIndex(indexPath.row) as! CategoryModel
        model.selected = (model.selected ? false : true);
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .None)
        // 选中值
        self.previousIndex = indexPath
    }
}

