//
//  AppDelegate.swift
//  JokeDay
//
//  Created by AYuan on 16/5/11.
//  Copyright © 2016年 AYuan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        //设置导航条和工具条外观
        //因为外观一旦设置全局有效，所以应该在程序一进来就设置
        UINavigationBar.appearance().tintColor = UIColor.redColor()
        UITabBar.appearance().tintColor = UIColor.redColor()
        
        //1.创建window
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.backgroundColor = UIColor.whiteColor()
        
        //2.创建根控制器
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

