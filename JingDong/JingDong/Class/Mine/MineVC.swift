//
//  MineVC.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/5/12.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class MineVC: BaseViewController, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = "我的";
        
        self.navigationController?.delegate = self;
        
        self.setUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - UINavigationControllerDelegate
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if viewController.isEqual(self)
        {
            self.navigationController?.navigationBarHidden = true;
        }
        else
        {
            self.navigationController?.navigationBarHidden = false;
        }
    }
    
    // MARK: - 视图
    
    func setUI()
    {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = UICollectionViewScrollDirection.Vertical
        let collectionView = MineCollectionView.init(frame: self.view.bounds, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
    }

}
