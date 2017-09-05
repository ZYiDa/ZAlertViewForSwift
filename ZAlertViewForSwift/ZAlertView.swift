//
//  ZAlertView.swift
//  ZAlertViewForSwift
//
//  Created by YYKit on 2017/9/4.
//  Copyright © 2017年 zl. All rights reserved.
//

import UIKit

//MARK:定义一些常量
let Width:CGFloat = UIScreen.main.bounds.size.width
let Height:CGFloat = 64.0
let Start_Height:CGFloat = -64.0
let Left_Offset:CGFloat = 45.0
let Font_Size:CGFloat = 14.0
let Image_Center_X:CGFloat = 25.0
let Image_Center_Y:CGFloat = 40.0
let Image_Width:CGFloat = 30.0
let ViewRect = CGRect.init(x: 0, y: Start_Height, width: Width, height: Height)

//MARK:弹窗类型
enum AlertViewType:Int
{
    case Success   = 0
    case Error     = 1
    case Message   = 2
    case NetStatus = 3
}


class ZAlertView: UIView
{
    private var alertViewType:AlertViewType?
    private var imageView:UIImageView?
    private var tipsLabel:UILabel?

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        self.leftImageView()
        self.rightTipsLabel()
    }



    //MARK:左侧的icon
    func leftImageView()
    {
        self.imageView = UIImageView.init()
        self.imageView?.isUserInteractionEnabled = true
        self.imageView?.frame = CGRect.init(x: 0, y: 0, width: Image_Width, height: Image_Width)
        self.imageView?.center = CGPoint.init(x: Image_Center_X, y: Image_Center_Y)
        self.addSubview(self.imageView!)
    }

    //MARK:右侧的提示信息Label
    func rightTipsLabel()
    {
        self.tipsLabel = UILabel.init()
        self.tipsLabel?.numberOfLines = 0
        self.tipsLabel?.isUserInteractionEnabled = true
        let tipsWidth = Width - Left_Offset
        self.tipsLabel?.frame = CGRect.init(x: Left_Offset, y: 20, width:tipsWidth, height: 40)
        self.tipsLabel?.textAlignment = NSTextAlignment.left
        self.tipsLabel?.font = UIFont.boldSystemFont(ofSize: Font_Size)
        self.addSubview(self.tipsLabel!)
    }

    //MARK:根据type的不同，设置不同的UI参数
    func topAlertViewTypewWith(type:AlertViewType,title:String)
    {
        self.frame = ViewRect
        let backColors = [UIColor.white,
                          UIColor.colorWith(hexString: "#ee7942", alpha: 1.0),
                          UIColor.colorWith(hexString: "#d4237a", alpha: 1.0),
                          UIColor.colorWith(hexString: "#dd1c5c", alpha: 1.0)]

        let textColors = [UIColor.colorWith(hexString: "#1296db", alpha: 1.0),
                          UIColor.colorWith(hexString: "#ffffff", alpha: 1.0),
                          UIColor.white,
                          UIColor.colorWith(hexString: "#ffffff", alpha: 1.0)]

        let images = [UIImage.init(named: "success"),
                      UIImage.init(named: "error"),
                      UIImage.init(named: "Alert"),
                      UIImage.init(named: "net")]


        self.backgroundColor = backColors[type.rawValue]
        self.imageView?.image = images[type.rawValue]
        self.tipsLabel?.textColor = textColors[type.rawValue]
        self.tipsLabel?.text = title
    }

    //MARK:提示窗出现的动画，Spring动画
    func show()
    {
        UIView.animate(withDuration: 0.918,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 1.0,
                       options: UIViewAnimationOptions.layoutSubviews,
                       animations: {
                        self.center = CGPoint.init(x: self.center.x, y: 32)
                        UIApplication.shared.keyWindow?.bringSubview(toFront: self)
        }) { (isFinish) in
        }
    }

    //MARK:移除提示窗的动画
    func dismiss()
    {
        UIView.animate(withDuration: 0.218,
                       delay: 0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 20.0,
                       options: UIViewAnimationOptions.layoutSubviews,
                       animations: {
                        self.center = CGPoint.init(x: self.center.x, y: -32)
        }) { (isFinish) in
            self.removeFromSuperview()
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



