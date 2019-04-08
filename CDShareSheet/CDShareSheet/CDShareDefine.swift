//
//  CDShareDefine.swift
//  CDShareSheet
//
//  Created by chardxu on 2019/4/4.
//  Copyright © 2019 chardxu. All rights reserved.
//

import UIKit

//设备宽高
public let CD_SCREEN_WIDTH:CGFloat     = UIScreen.main.bounds.size.width
public let CD_SCREEN_HEIGHT:CGFloat    = UIScreen.main.bounds.size.height
public let CD_HEIGHT_STATUSBAR:CGFloat = UIApplication.shared.statusBarFrame.size.height

//自定义宽高
public let CD_CANCEL_HEIGHT:CGFloat = UIApplication.shared.statusBarFrame.size.height > 20.0 ? 83.0 : 49.0
public let CD_ITEMCELL_HEIGHT:CGFloat = 123.0
public let CD_ITEMCELL_WIDTH:CGFloat  = 72.0
public let CD_ITEMCELL_PADDING:CGFloat = 14.0

//自定义转场动画
public let CD_ANIMATEDURATION = 0.3
public let CD_BACKGROUND_ALPHA = 0.3

//随机颜色
func CD_COLOR_RANDOM() -> UIColor {
    let randomRed:CGFloat = CGFloat(arc4random_uniform(256))
    let randomGreen:CGFloat = CGFloat(arc4random_uniform(256))
    let randomBlue:CGFloat = CGFloat(arc4random_uniform(256))
    return UIColor.init(red: randomRed/255.0, green: randomGreen/255.0, blue: randomBlue/255.0, alpha: 1)
}
