//
//  ViewController.swift
//  ZAlertViewForSwift
//
//  Created by YYKit on 2017/9/4.
//  Copyright © 2017年 zl. All rights reserved.
//

import UIKit

class ViewController: UIViewController{


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.colorWith(hexString: "#ebebeb", alpha: 1.0)
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAction(_ sender: UISegmentedControl)
    {
        let titles = ["成功","失败","信息警告","网络连接失败!"]

        ZAlertViewManager.shareManager.showWith(type: AlertViewType(rawValue: sender.selectedSegmentIndex)!, title: titles[sender.selectedSegmentIndex])
        ZAlertViewManager.shareManager.didSelectedToHideAlertView {
        }
    }

    @IBAction func dismissAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0
        {
            ZAlertViewManager.shareManager.dismissAlertWith(time: 3)
        }
        else
        {
            ZAlertViewManager.shareManager.dismissAlertImmediately()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

