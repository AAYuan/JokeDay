//
//  TitleButton.swift
//  JokeDay
//
//  Created by AYuan on 16/5/21.
//  Copyright © 2016年 AYuan. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        self.setImage(UIImage(named: "navigationbar_arrow_down"), forState: UIControlState.Normal)
        self.setImage(UIImage(named: "navigationbar_arrow_up"), forState: UIControlState.Selected)
        self.sizeToFit()
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //OC中不能直接访问对象的属性成员，swift中可以
        titleLabel?.frame.origin.x = 0
        imageView?.frame.origin.x = titleLabel!.frame.size.width
    }
}
