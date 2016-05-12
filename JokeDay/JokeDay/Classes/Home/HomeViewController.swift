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
        if !userLogin{
            
            visitView?.setupVisitorInfo(true, imageName: "visitordiscover_feed_image_house", labelText: "关注一些人，回这里看看有什么惊喜")
            
            
        }
    }

}
