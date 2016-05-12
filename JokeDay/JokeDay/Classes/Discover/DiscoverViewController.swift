//
//  DiscoverViewController.swift
//  JokeDay
//
//  Created by AYuan on 16/5/11.
//  Copyright © 2016年 AYuan. All rights reserved.
//

import UIKit

class DiscoverViewController: BaseViewController {

    override func viewDidLoad() {
        if !userLogin{
            
                visitView?.setupVisitorInfo(false, imageName: "visitordiscover_image_message", labelText: "登录后，最新热门尽在掌握，不再会与实事潮流擦肩而过")
        
            
        }
        
    }
    
}
