//
//  ViewController.swift
//  CDShareSheet
//
//  Created by chardxu on 2019/4/3.
//  Copyright © 2019 chardxu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let btn = UIButton.init(type: .custom)
        btn.frame = CGRect(x: 200, y: 200, width: 200, height: 100)
        btn.backgroundColor = UIColor.red
        btn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        view.addSubview(btn)
    }
    
    @objc func btnAction() {
        let item00 = CDShareItem.cdinit(title: "发送给朋友", icon: "share_wechat_friends") {
            print("发送给朋友")
        }
        
        let item01 = CDShareItem.cdinit(title: "分享到朋友圈", icon: "share_wechat_moments") {
            print("分享到朋友圈")
        }
        let item02 = CDShareItem.cdinit(title: "收藏", icon: "share_wechat_favorites") {
            print("收藏")
        }
        
        let item10 = CDShareItem.cdinit(title: "复制链接", icon: "func_copylink") {
            print("复制链接")
        }
        let item11 = CDShareItem.cdinit(title: "刷新", icon: "func_refresh") {
            print("刷新")
        }
        
        let shareItems = [item00, item01, item02]
        let functionItems = [item10, item11]
        let sheet = CDShareSheet.cdinit(shareItems: shareItems, functionItems: functionItems)
        sheet.show()
        
        print("btnAction,sheet=", sheet)
    }
}

