//
//  CategoryVC.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/5/12.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class CategoryVC: BaseViewController {

    var categoryList:CategoryListView!
    var categoryDetail:CategoryDetailView!
    
    var categoryLists:NSMutableArray!
    var categoryDetails:NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "分类";
        
        self.setUI()
        self.setData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - 视图
    
    func setUI()
    {
        self.categoryList = CategoryListView(frame: CGRectMake(0.0, 0.0, widthCategoryListCell, self.view.height), style: .Plain)
        self.view.addSubview(self.categoryList)
        
        let currentView = self.categoryList
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        self.categoryDetail = CategoryDetailView(frame: CGRectMake((currentView.right + 10.0), 0.0, widthCategoryDetailView, currentView.height), collectionViewLayout: layout)
        self.view.addSubview(self.categoryDetail)
        // 响应回调
//        self.categoryDetail.itemClick {
//            (clickIndex) -> Void in
//            
//        }
//        let indexPath = self.categoryDetail.itemClick() 
//        print("你点击了第 \(indexPath.section) 个section中的第 \(indexPath.row) 个row")
    }
    
    // MARK: - 数据 
    func setData()
    {
        let lists:[String] = ["推荐分类", "京东超市", "全球购", "男装", "女装", "男鞋", "女鞋", "内衣配饰", "箱包手袋", "家电", "手机", "家具"]
        
        // 一级分类
        self.categoryLists = NSMutableArray()
        for index in 0..<lists.count
        {
            let model = CategoryModel()
            
            let text = lists[index]
            model.title = text
            model.selected = false
            
            self.categoryLists.addObject(model)
        }
        // 二三级分类
        let array = NSMutableArray()
        for index in 0..<lists.count
        {
            let model = CategoryDetailModel()
            model.categoryName = lists[index]
            model.categoryImage = ""
            model.categoryId = String(index)
            
            array.addObject(model)
        }
        self.categoryDetails = NSMutableArray()
        for index in 0..<lists.count
        {
            let model = CategoryDetailModel()
            model.title = lists[index]
            model.categorys = array
            
            self.categoryDetails.addObject(model)
        }
        
        // 赋值
        self.categoryList.datas = self.categoryLists
        self.categoryList.reloadData()
        
        self.categoryDetail.datas = self.categoryDetails;
        self.categoryDetail.reloadData()
    }

}
