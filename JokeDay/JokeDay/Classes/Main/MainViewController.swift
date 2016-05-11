//
//  MainViewController.swift
//  JokeDay
//
//  Created by AYuan on 16/5/11.
//  Copyright © 2016年 AYuan. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor.blackColor()
        addChildViewController("HomeViewController", title: "首页", imageName: "tabBar_essence_icon")
        addChildViewController("MessageViewController", title: "消息", imageName: "tabBar_friendTrends_icon")
        addChildViewController("DiscoverViewController", title: "广场", imageName: "tabBar_new_icon")
        addChildViewController("ProfileViewController", title: "我", imageName: "tabBar_me_icon")
        

    }
    
    /**
     初始化子控制器
     
     :param: childController 需要初始化的子控制器
     :param: title           子控制器的标题
     :param: imageName       子控制器的图片
     */
//    private func addChildViewController(childController: UIViewController, title: String, imageName: String) {
    private func addChildViewController(childControllerName: String, title: String, imageName: String) {
        
        //-1.动态获取命名空间
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String;
        
        
        //0.将字符串转为类
        //0.1默认情况下命名空间就是项目的名称，但是命名空间名称是可以修改的
        let cls:AnyClass? = NSClassFromString(ns + "." + childControllerName)
        //0.2通过类创建对象
        //0.2.1 将AnyClass转为制定类型
        let vcCls = cls as! UIViewController.Type
        //0.2.2 通过class创建对象
        let vc = vcCls.init()
        
        //1.设置每个控制器对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_click")
        vc.title = title;
        
        //2.添加到导航控制器中
        let nav = UINavigationController()
        nav.addChildViewController(vc)
        
        //3.将导航控制器添加到当前tabbar控制器上
        addChildViewController(nav)
        
    }
    

}
