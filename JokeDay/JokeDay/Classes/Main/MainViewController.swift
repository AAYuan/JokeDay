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
        
        //1.获取控制器json文件路径
        let path = NSBundle.mainBundle().pathForResource("MainVCSettings.json", ofType: nil)
        //2.通过文件路径创建NSData
        if let jsonPath = path{
            let jsonData = NSData(contentsOfFile: jsonPath)
            
            do{
                //有可能发生异常的代码
                //3.序列化json数据->Array
                // try : 发生异常会跳到catch中继续执行
                // try! : 发生异常程序直接崩溃
                let dictArr = try NSJSONSerialization.JSONObjectWithData(jsonData!, options: NSJSONReadingOptions.MutableContainers)
                //4.遍历数组，动态创建控制器和设置数据
                // 在Swift中, 如果需要遍历一个数组, 必须明确数据的类型
                for dict in dictArr as! [[String:String]]
                {
                    //报错的原因是因为addChildViewController参数必须有值, 但是字典的返回值是可选类型
                    addChildViewController(dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
                }
                
            }catch{
                //发生异常后执行的代码
                print(error)
                
                // 从本地创建控制器
                addChildViewController("HomeViewController", title: "首页", imageName: "tabBar_essence_icon")
                addChildViewController("MessageViewController", title: "消息", imageName: "tabBar_friendTrends_icon")
                addChildViewController("DiscoverViewController", title: "广场", imageName: "tabBar_new_icon")
                addChildViewController("ProfileViewController", title: "我", imageName: "tabBar_me_icon")

                
            }
            
        }
        
        

    }
    
    /**
     初始化子控制器
     
     :param: childController 需要初始化的子控制器
     :param: title           子控制器的标题
     :param: imageName       子控制器的图片
     */
//    private func addChildViewController(childController: UIViewController, title: String, imageName: String) {
    private func addChildViewController(childControllerName: String, title: String, imageName: String) {
        
        // -1.动态获取命名空间
        let ns = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] as! String
        
        // 0 .将字符串转换为类
        // 0.1默认情况下命名空间就是项目的名称, 但是命名空间名称是可以修改的
        let cls:AnyClass? = NSClassFromString(ns + "." + childControllerName)
        // 0.2通过类创建对象
        // 0.2.1将AnyClass转换为指定的类型
        let vcCls = cls as! UIViewController.Type
        // 0.2.2通过class创建对象
        let vc = vcCls.init()
        
        // 0.1通过类创建一个对象
        
        
        // 1设置首页对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        vc.title = title
        
        // 2.给首页包装一个导航控制器
        let nav = UINavigationController()
        nav.addChildViewController(vc)
        
        // 3.将导航控制器添加到当前控制器上
        addChildViewController(nav)

        
    }
    

}
