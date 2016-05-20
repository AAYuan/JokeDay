//
//  UIBarButtonItem+category.swift
//  JokeDay
//
//  Created by AYuan on 16/5/21.
//  Copyright © 2016年 AYuan. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    
    // 如果在func前面加上class, 相当于OC中的+
    class func createBarButtonItem(imageName: String,target: AnyObject?, action: Selector) ->UIBarButtonItem
    {
        let btn = UIButton();
        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        btn.sizeToFit()
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        return UIBarButtonItem(customView: btn)
    }

    
}