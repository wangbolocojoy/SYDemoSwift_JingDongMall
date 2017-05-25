//
//  MineCollectionView.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/5/17.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class MineCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.autoresizingMask = .FlexibleHeight;
        self.showsHorizontalScrollIndicator = false;
        self.showsVerticalScrollIndicator = false;
        self.backgroundColor = UIColor.clearColor();
        self.scrollEnabled = true;
        
        self.registerClass(MineCollectionHeaderADView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseMineCollectionHeaderADView)
        self.registerClass(MineCollectionHeaderTitleView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: reuseMineCollectionHeaderTitleView)
        self.registerClass(GoodsListCollectionCell.self, forCellWithReuseIdentifier: reuseGoodsListCollectionCell)
        
        self.delegate = self;
        self.dataSource = self;
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
       
        var headerView:UICollectionReusableView!
        
        if (kind == UICollectionElementKindSectionHeader)
        {
            if (0 == indexPath.section)
            {
                headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: reuseMineCollectionHeaderADView, forIndexPath: indexPath);
                headerView.backgroundColor = UIColor.colorRandom();
         
            }
            headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: reuseMineCollectionHeaderTitleView, forIndexPath: indexPath);
            headerView.backgroundColor = UIColor.colorRandom();
        }
        
        return headerView;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseGoodsListCollectionCell, forIndexPath: indexPath) as! GoodsListCollectionCell;
        cell.imageView.image = UIImage(named: "header");
        cell.nameLabel.text = "高性能应用开发书箱";
        cell.priceLabel.text = "￥47.60";
//        cell.itemClick {
//            () in
//            print("click \(indexPath)")
//        };
        return cell;
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("click \(indexPath)")
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(widthGoodsListCollectionCell, heightGoodsListCollectionCell)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(originXYGoodsListCollectionCell, originXYGoodsListCollectionCell, originXYGoodsListCollectionCell, originXYGoodsListCollectionCell)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return originXYGoodsListCollectionCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return originXYGoodsListCollectionCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size = (0 == section ? CGSizeMake(kScreenWitdh, heightMineCollectionHeaderADView) : CGSizeMake(kScreenWitdh, heightMineCollectionHeaderTitleView))
        return size
    }
}
