//
//  CDShareSheet.swift
//  CDShareSheet
//
//  Created by chardxu on 2019/4/3.
//  Copyright © 2019 chardxu. All rights reserved.
//

import UIKit

extension Notification.Name {
    public struct CDShareNoti {
        public static let CD_HideNotification = Notification.Name(rawValue: "CD_HideNotification")
    }
}

class CDShareSheet: UIView {

    // MARK: - Private
    private var shareToolBar:CDShareToolBar?
    private var backgroundView:UIView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // shareToolBar
        let bar = CDShareToolBar.init(frame: CGRect(x: 0, y: CD_SCREEN_HEIGHT, width: CD_SCREEN_WIDTH, height: 0))
//        bar.backgroundColor = CD_COLOR_RANDOM()
        weak var weakSelf = self
        bar.cCancelClosure = {
            print("cancel")
            weakSelf!.hide()
        }
        shareToolBar = bar
        
        // backgroundView
        let backV = UIView.init(frame: CGRect(x: 0, y: 0, width: CD_SCREEN_WIDTH, height: CD_SCREEN_HEIGHT))
        backV.backgroundColor = UIColor.black
        backV.alpha = 0
        
        let tapGes = UITapGestureRecognizer.init(target: self, action: #selector(hide))
        backV.addGestureRecognizer(tapGes)
        backgroundView = backV
        
        NotificationCenter.default.addObserver(self, selector: #selector(shareSheetHideAction), name: Notification.Name.CDShareNoti.CD_HideNotification, object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func shareSheetHideAction() {
//        print("shareSheetHideAction")
        print("shareSheetHideAction,self=", self)
        self.hide()
    }
    
    deinit {
        print("CDShareSheet deinit")
        NotificationCenter.default.removeObserver(self, name: Notification.Name.CDShareNoti.CD_HideNotification, object: nil)
    }
    
    func addToKeyWindow() {
        if superview == nil {
            let keyWindow = UIApplication.shared.keyWindow?.rootViewController?.view
            keyWindow?.addSubview(self)
            
            addSubview(backgroundView!)
            addSubview(shareToolBar!)
        }
    }
    
    func removeFromKeyWindow() {
        if self.superview != nil {
            self.removeFromSuperview()
            
//            NotificationCenter.default.removeObserver(self, name: Notification.Name.CDShareNoti.CD_HideNotification, object: nil)
        }
    }
    
    func showAnimation() {
        UIView.animate(withDuration: CD_ANIMATEDURATION) {
            self.backgroundView?.alpha = CGFloat(CD_BACKGROUND_ALPHA)
            
            var frame = self.shareToolBar!.frame
            frame.origin.y = CD_SCREEN_HEIGHT - (self.shareToolBar?.sheetHeight())!
            self.shareToolBar!.frame = frame
        }
    }
    
    // MARK: - Public
    
    /// init method
    ///
    /// - Parameters:
    ///   - shareItems: the items to share
    ///   - functionItems: the items to other function
    /// - Returns:CDShareSheet
    public class func cdinit(shareItems:Array<CDShareItem>, functionItems:Array<CDShareItem>) -> CDShareSheet {
        let frame = CGRect(x: 0, y: 0, width: CD_SCREEN_WIDTH, height: CD_SCREEN_HEIGHT)

        let sheet = CDShareSheet(frame: frame)
        
        var mArr = Array<Array<CDShareItem>>()
        if shareItems.count > 0 {
            mArr.append(shareItems)
        }
        if functionItems.count > 0 {
            mArr.append(functionItems)
        }
        sheet.shareToolBar?.dataArray.append(contentsOf: mArr)
        
        return sheet
    }
    
    
    /// CDShareSheet show
    public func show() {
        addToKeyWindow()
        showAnimation()
    }
    
    @objc public func hide() {
        UIView.animate(withDuration: CD_ANIMATEDURATION, animations: {
            self.backgroundView?.alpha = 0
            
            var frame = self.shareToolBar?.frame
            frame?.origin.y = CD_SCREEN_HEIGHT
            self.shareToolBar?.frame = frame!
        }) { (finished) in
            self.removeFromKeyWindow()
        }
    }
}


