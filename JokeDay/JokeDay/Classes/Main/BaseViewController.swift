//
//  BaseViewController.swift
//  JokeDay
//
//  Created by AYuan on 16/5/11.
//  Copyright © 2016年 AYuan. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {

    
    override func loadView() {
        let customView = UIView()
        customView.backgroundColor = UIColor.cyanColor()
        view = customView
        
    }
}
