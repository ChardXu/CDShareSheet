//
//  CDShareItemCell.swift
//  CDShareSheet
//
//  Created by chardxu on 2019/4/8.
//  Copyright © 2019 chardxu. All rights reserved.
//

import UIKit

class CDShareItemCell: UICollectionViewCell {
    
    var _item:CDShareItem?
    var item:CDShareItem? {
        get {
            return _item
        }
        set {
            _item = newValue;
            
            self.iconView?.setImage(UIImage(named: newValue!.cicon), for: UIControl.State.normal)
            self.titleView?.text = newValue?.ctitle
        }
    }
    
    var iconView:UIButton?
    var titleView:UITextView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let topPadding:CGFloat = 15.0
        let iconView2TitleH:CGFloat = 10.0
        let cellWidth:CGFloat = self.frame.width
        let titleInset:CGFloat = 4
        
        // icon
        let iconViewX:CGFloat = CD_ITEMCELL_PADDING/2.0
        let iconViewY:CGFloat = topPadding
        let iconViewW:CGFloat = cellWidth - CD_ITEMCELL_PADDING
        let iconViewH:CGFloat = cellWidth - CD_ITEMCELL_PADDING
        self.iconView?.frame = CGRect(x: iconViewX, y: iconViewY, width: iconViewW, height: iconViewH)
        
        // title
        let titleViewX:CGFloat = -titleInset
        let titleViewY:CGFloat = topPadding + iconViewH + iconView2TitleH
        let titleViewW:CGFloat = cellWidth + 2.0*titleInset
        let titleViewH:CGFloat = 30.0
        self.titleView?.frame = CGRect(x: titleViewX, y: titleViewY, width: titleViewW, height: titleViewH)
    }
    
    func commonInit() {
        let iconV = UIButton.init()
        iconV.addTarget(self, action: #selector(iconAction), for: UIControl.Event.touchDown)
        self.iconView = iconV
        self.addSubview(self.iconView!)
        
        let titleV = UITextView.init()
        titleV.textColor = UIColor.darkGray
        titleV.font = UIFont.systemFont(ofSize: 11)
        titleV.contentInset = UIEdgeInsets(top: -10, left: 0, bottom: 0, right: 0)
        titleV.backgroundColor = nil
        titleV.textAlignment = NSTextAlignment.center
        titleV.isUserInteractionEnabled = false
        self.titleView = titleV
        self.addSubview(titleView!)
    }
    
    @objc func iconAction() {
        if ((self.item?.chandler) != nil) {
            NotificationCenter.default.post(name: Notification.Name.CDShareNoti.CD_HideNotification, object: nil)
            self.item?.chandler!()
        }
    }
    
}
