//
//  MessageViewController.swift
//  JokeDay
//
//  Created by AYuan on 16/5/11.
//  Copyright © 2016年 AYuan. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController {

    override func viewDidLoad() {
        if !userLogin {
            visitView?.setupVisitorInfo(false, imageName: "visitordiscover_image_message", labelText: "登录后，别人评论你的帖子，发给你的消息，都在这里显示")
            
        }
    }
}
