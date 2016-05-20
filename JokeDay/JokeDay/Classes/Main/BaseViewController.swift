//
//  BaseViewController.swift
//  JokeDay
//
//  Created by AYuan on 16/5/11.
//  Copyright © 2016年 AYuan. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController, VisitorViewDelegate {

    
    // 定义一个变量保存用户当前是否登录
    var userLogin = true
    //定义属性保存未登录界面
    var visitView: VisitorView?
    override func loadView() {
        
        userLogin ? super.loadView() : setupVisitorView()

    }
    
    // MARK: - 内部控制方法
    /**
    创建未登录界面
    */
    private func setupVisitorView()
    {
        //初始化未登录界面
        let customView = VisitorView()
        view = customView
        visitView = customView
        visitView?.delegate = self
        
        //2.设置导航条未登录界面
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: UIBarButtonItemStyle.Plain, target: self, action: "registerBtnWillClick")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: UIBarButtonItemStyle.Plain, target: self, action: "loginBtnWillClick")
        
    }
    
    //MARK:- VisitorViewDelegate
    func loginBtnWillClick() {
        print(__FUNCTION__)
    }
    
    func registerBtnWillClick() {
        print(__FUNCTION__)
    }
}
