//
//  CDShareToolBar.swift
//  CDShareSheet
//
//  Created by chardxu on 2019/4/4.
//  Copyright © 2019 chardxu. All rights reserved.
//

import UIKit
import AVKit

class CDShareToolBar: UIToolbar, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Init
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(titleLabel)
        addSubview(table)
        addSubview(cancelButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        var selfFrame = self.frame
        selfFrame.size.height = sheetHeight()
        self.frame = selfFrame
        
        self.titleLabel.frame = CGRect(x: CDShareToolBar.CD_TITLE_PADDING, y: 0, width: CD_SCREEN_WIDTH-2*CDShareToolBar.CD_TITLE_PADDING, height: self.titleHeight())
        self.cancelButton.frame = CGRect(x: 0, y: self.frame.size.height-CD_CANCEL_HEIGHT, width: CD_SCREEN_WIDTH, height: CD_CANCEL_HEIGHT)
        self.table.frame = CGRect(x: 0, y: self.titleHeight(), width: CD_SCREEN_WIDTH, height: CGFloat(self.dataArray.count) * CD_ITEMCELL_HEIGHT)
        
        if #available(iOS 11.0, *) {
            let subviews = self.subviews
            for view in subviews {
                if view.isKind(of: NSClassFromString("_UIToolbarContentView")!) {
                    let testView = view
                    testView.isUserInteractionEnabled = false
                }
            }
        }
        
    }
    
    func sheetHeight() -> CGFloat {
        return self.initHeight() + CGFloat(self.dataArray.count) * CD_ITEMCELL_HEIGHT - 1
    }
    
    func initHeight() -> CGFloat {
        return CD_CANCEL_HEIGHT + self.titleHeight()
    }
    
    // MARK: - Subviews
    // MARK: --Title
    static let CD_TITLE_HEIGHT:CGFloat = 30.0
    static let CD_TITLE_PADDING:CGFloat = 20.0
    lazy var titleLabel:UILabel = {
        var lab = UILabel()
        lab.textColor = UIColor.darkGray
        lab.text = "分享"
        lab.textAlignment = NSTextAlignment.center
        lab.font = UIFont.systemFont(ofSize: 13)
        return lab
    }()
    func titleHeight() -> CGFloat {
        return titleLabel.text!.count > 0 ? CDShareToolBar.CD_TITLE_HEIGHT : 0
    }
    
    // MARK: --Table
    lazy var table:UITableView = {
        var tab = UITableView()
        tab.tableFooterView = UIView()
        tab.rowHeight = CD_ITEMCELL_HEIGHT
        tab.bounces = false
        tab.backgroundColor = nil
        tab.dataSource = self
        tab.delegate = self
        return tab
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let items:Array<CDShareItem> = self.dataArray[indexPath.row]
        let cell = CDShareSheetCell.cell(tableView: tableView)
        cell.items = items
        return cell
    }
    
    // MARK: --Cancel
    typealias CancelClosure = () -> ()
    var cCancelClosure: CancelClosure? = nil
    
    var cancelButton:UIButton = {
        var btn = UIButton()
        btn.backgroundColor = UIColor.white
        btn.setTitle("取消", for: UIControl.State.normal)
        btn.setTitleColor(UIColor.darkText, for: UIControl.State.normal)
        btn.addTarget(self, action: #selector(cancelBtnAction), for: UIControl.Event.touchUpInside)
        return btn
    }()
    
    @objc func cancelBtnAction() {
        if cCancelClosure != nil {
            self.cCancelClosure!()
        }
    }

    // MARK: - Data
    var dataArray:Array<Array<CDShareItem>> = []
}
