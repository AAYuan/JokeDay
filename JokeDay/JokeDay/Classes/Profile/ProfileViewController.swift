//
//  ProfileViewController.swift
//  JokeDay
//
//  Created by AYuan on 16/5/11.
//  Copyright © 2016年 AYuan. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    override func viewDidLoad() {
        // 1.如果没有登录, 就设置未登录界面的信息
        if !userLogin
        {
            visitView?.setupVisitorInfo(false, imageName: "visitordiscover_image_profile", labelText: "登录后，你的帖子、相册、个人资料会显示在这里，展示给别人")
        }
    }

}
