//
//  CategoryDetailView.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/6/14.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

//// 响应回调
//typealias itemClickBlock = (clickIndex:NSIndexPath)->Void

let widthCategoryDetailView:CGFloat = (kScreenWitdh - widthCategoryListCell - 10.0 * 2)

class CategoryDetailView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var datas:NSArray!
//    var itemClick = itemClickBlock?()
    var clickIndexPath:NSIndexPath!
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.autoresizingMask = .FlexibleHeight;
        self.showsHorizontalScrollIndicator = false;
        self.showsVerticalScrollIndicator = false;
        self.backgroundColor = UIColor.clearColor();
        self.scrollEnabled = true;
        
        self.registerClass(CategoryDetailImageHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifierCategoryDetailImageHeader)
        self.registerClass(CategoryDetailTitleHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseIdentifierCategoryDetailTitleHeader)
        self.registerClass(CategoryDetailCell.self, forCellWithReuseIdentifier: reuseIdentifierCategoryDetailCell)
        
        self.delegate = self;
        self.dataSource = self;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return self.datas.count
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        var headerView:UICollectionReusableView!
        
        if (kind == UICollectionElementKindSectionHeader)
        {
            let model = self.datas.objectAtIndex(indexPath.section) as! CategoryDetailModel
            let title = model.title
            
            if (0 == indexPath.section)
            {
                headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: reuseIdentifierCategoryDetailImageHeader, forIndexPath: indexPath)

                (headerView as! CategoryDetailImageHeader).imageView.image = UIImage(named: "header")
                (headerView as! CategoryDetailImageHeader).titleLabel.text = title
            }
            else
            {
                headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: reuseIdentifierCategoryDetailTitleHeader, forIndexPath: indexPath);
                (headerView as! CategoryDetailTitleHeader).titleLabel.text = title
            }
        }
        
        return headerView;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let model = self.datas.objectAtIndex(section) as! CategoryDetailModel
        let array:NSArray = model.categorys!
        return array.count
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifierCategoryDetailCell, forIndexPath: indexPath) as! CategoryDetailCell;
        
        let model = self.datas.objectAtIndex(indexPath.section) as! CategoryDetailModel
        let array:NSArray = model.categorys!
        let rowModel = array.objectAtIndex(indexPath.row) as! CategoryDetailModel
        cell.reloadUI(model: rowModel)
 
//        cell.itemClick
        
        return cell;
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("click \(indexPath)")
        
//        // 响应回调
//        if (itemClick != nil)
//        {
//            itemClick?(clickIndex: indexPath)
//        }
        
//        self.clickIndexPath = indexPath
//        self.itemClick()
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSizeMake(widthCategoryDetailCell, heightCategoryDetailCell)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(0.0, 0.0, 10.0, 0.0)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0.0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let size = (0 == section ? CGSizeMake(widthCategoryDetailView, heightCategoryDetailImageHeader) : CGSizeMake(widthCategoryDetailView, heightCategoryDetailTitleHeader))
        return size
    }
    
//    // MARK: - 定义回调方法
//    func itemClick() -> NSIndexPath
//    {
//        return self.clickIndexPath!
//    }

}
