//
//  HomeViewController.swift
//  JokeDay
//
//  Created by AYuan on 16/5/11.
//  Copyright © 2016年 AYuan. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        
        //1.如果未登录，就设置登录界面信息
        if !userLogin{
            
            visitView?.setupVisitorInfo(true, imageName: "visitordiscover_feed_image_house", labelText: "关注一些人，回这里看看有什么惊喜")
            return;
        }
        
        //2.初始化导航条
        setupNav()
        
        
    }
    
    private func setupNav()
    {
        /*
        //左边按钮
        let leftBtn = UIButton();
        leftBtn.setImage(UIImage(named: "navigationbar_friendattention"), forState: UIControlState.Normal)
        leftBtn.setImage(UIImage(named: "navigationbar_friendattention_highlighted"), forState: UIControlState.Highlighted)
        leftBtn.sizeToFit()
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
        
        //右边按钮
        let rightBtn = UIButton();
        rightBtn.setImage(UIImage(named: "navigationbar_pop"), forState: UIControlState.Normal)
        rightBtn.setImage(UIImage(named: "navigationbar_pop_highlighted"), forState: UIControlState.Highlighted)
        rightBtn.sizeToFit()
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtn)
       */
        
        /*
        navigationItem.leftBarButtonItem = createBarButtonItem("navigationbar_friendattention", target: self, action: "leftItemClick")
        navigationItem.rightBarButtonItem = createBarButtonItem("navigationbar_pop", target: self, action: "rightItemClick")
        */
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem("navigationbar_friendattention", target: self, action: "leftItemClick")
        navigationItem.rightBarButtonItem = UIBarButtonItem.createBarButtonItem("navigationbar_pop", target: self, action: "rightItemClick")
        
    }
    
    func leftItemClick()
    {
        print(__FUNCTION__)
    }
    
    func rightItemClick()
    {
        print(__FUNCTION__)
    }
    
    /*
    private func createBarButtonItem(imageName: String,target: AnyObject?, action: Selector) ->UIBarButtonItem
    {
        let btn = UIButton();
        btn.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), forState: UIControlState.Highlighted)
        btn.sizeToFit()
        btn.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        return UIBarButtonItem(customView: btn)
    }
    */
    
    

}
