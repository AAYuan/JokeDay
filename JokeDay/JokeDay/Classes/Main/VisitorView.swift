//
//  VisitorView.swift
//  JokeDay
//
//  Created by AYuan on 16/5/12.
//  Copyright © 2016年 AYuan. All rights reserved.
//

import UIKit

//Swift中定义协议：必须遵守NSObjectProtocol
//因为view中做不了modal操作，监听来要给别人用，所以定义一个协议让别人来用
protocol VisitorViewDelegate: NSObjectProtocol{
    //登录回调
    func loginBtnWillClick()
    //注册回调
    func registerBtnWillClick()
}

class VisitorView: UIView {
    
    //定义一个属性保存代理对象
    //一定要加上weak，避免循环引用
    weak var delegate: VisitorViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        // 1.添加子控件
        addSubview(iconView)
        addSubview(maskBGView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginButton)
        addSubview(registerButton)
        
        // 2.布局子控件
        // 2.1设置背景
        iconView.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        // 2.2设置小房子
        homeIcon.xmg_AlignInner(type: XMG_AlignType.Center, referView: self, size: nil)
        // 2.3设置文本
        messageLabel.xmg_AlignVertical(type: XMG_AlignType.BottomCenter, referView: iconView, size:nil)
        
        // "哪个控件" 的 "什么属性" "等于" "另外一个控件" 的 "什么属性" 乘以 "多少" 加上 "多少"
        let widthCons = NSLayoutConstraint(item: messageLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1.0, constant: 224)
        addConstraint(widthCons)
        
        // 2.4设置按钮
        registerButton.xmg_AlignVertical(type: XMG_AlignType.BottomLeft, referView: messageLabel, size: CGSize(width: 100, height: 30), offset: CGPoint(x: 0, y: 20))
        
        loginButton.xmg_AlignVertical(type: XMG_AlignType.BottomRight, referView: messageLabel, size: CGSize(width: 100, height: 30), offset: CGPoint(x: 0, y: 20))
        
        // 2.5设置蒙版
        maskBGView.xmg_Fill(self)
    }
    
    /**
     设置未登录界面
     
     :param: isHome    是否是首页
     :param: imageName 需要展示的图标名称
     :param: labelText   需要展示的文本内容
     */
    func setupVisitorInfo(isHome: Bool,imageName: String,labelText: String)
    {
        //如果不是首页，就隐藏转盘
        iconView.hidden = !isHome
        //修改中间图标
        homeIcon.image = UIImage(named: imageName)
        //修改文本
        messageLabel.text = labelText
        
        //判断是否需要执行动画
        if isHome
        {
            startAnimation()
        }
    }
    

    func loginBtnClick(){
        
        //oc中调用代理方法要先判断是否会响应,response...
        //swift中不用，因为delegate没有值的话loginBtnWillClick也不会起作用
        delegate?.loginBtnWillClick()
    }
    func registerBtnClick(){
        delegate?.registerBtnWillClick()
    }
    
    //MARK: - 内部控制方法
    private func startAnimation(){
        //1.创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        //2.设置动画属性
        anim.toValue = 2 * M_PI
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        //该属性默认为YES,代表动画只要执行完毕就移除
        anim.removedOnCompletion = false
        //3.将动画添加大图层上
        iconView.layer.addAnimation(anim, forKey: nil)
        
    }
    
    
    // Swift推荐我们自定义一个控件,要么用纯代码, 要么就用xib/stroyboard
    required init?(coder aDecoder: NSCoder) {
        // 如果通过xib/stroyboard创建该类, 那么就会崩溃
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - 懒加载控件
    /// 转盘
    private lazy var iconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return iv
    }()
    /// 图标
    private lazy var homeIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return iv
    }()
    /// 文本
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.darkGrayColor()
        return label
    }()
    /// 登录按钮
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.darkGrayColor(), forState: UIControlState.Normal)
        btn.setTitle("登录", forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        btn.addTarget(self, action: "loginBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    /// 注册按钮
    private lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        btn.setTitle("注册", forState: UIControlState.Normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), forState: UIControlState.Normal)
        btn.addTarget(self, action: "registerBtnClick", forControlEvents: UIControlEvents.TouchUpInside)
        return btn
    }()
    
    private lazy var maskBGView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_mask_smallicon"))
        return iv
    }()

}
