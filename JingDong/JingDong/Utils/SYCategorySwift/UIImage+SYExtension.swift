//
//  UIImage+SYExtension.swift
//  zhangshaoyu
//
//  Created by zhangshaoyu on 17/5/18.
//  Copyright © 2017年 zhangshaoyu. All rights reserved.
//

import UIKit

extension UIImage {
    
    // MARK: - 图片
    
    class func imageWithName(name:String) -> UIImage
    {
        let image: UIImage = UIImage(named: name)!
        return image
    }
    
    class func imageFromBundle(name name:String, type:String) -> UIImage
    {
        let filePath:String = NSBundle.mainBundle().pathForResource(name, ofType: type)!
        let image: UIImage = UIImage(contentsOfFile: filePath)!
        return image
    }
    
    class func imageWithURL(url:String) -> UIImage
    {
        let url:NSURL = NSURL.fileURLWithPath(url)
        let data:NSData = NSData(contentsOfURL: url)!
        let image: UIImage = UIImage(data: data)!
        return image
    }
    
    class func imageUIEdgeWithName(name name:String, edge:UIEdgeInsets) -> UIImage
    {
        var image = UIImage(named: name)
        image = image?.resizableImageWithCapInsets(edge, resizingMode: .Stretch)
        return image!
    }

}
