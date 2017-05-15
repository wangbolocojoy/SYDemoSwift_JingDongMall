//
//  TempViewController.swift
//  JingDong
//
//  Created by zhangshaoyu on 17/5/15.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

class TempViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var width = kScreenWitdh
        print(width)
        
        width = GetScreenWidth()
        print(width)
        
        var time = kDateFormat_Hm
        print("time = \(time)")
        
        time = TimeFormat.format_yyyyMdHmsS.rawValue
        print("time = \(time)")
        
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

}
