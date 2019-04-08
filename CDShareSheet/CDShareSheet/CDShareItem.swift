//
//  CDShareItem.swift
//  CDShareSheet
//
//  Created by chardxu on 2019/4/3.
//  Copyright © 2019 chardxu. All rights reserved.
//

import UIKit

public class CDShareItem: NSObject {
    
    // MARK: - Private
    
    // MARK: - Public
    /// Block
    typealias CDHandler = () -> ()
    
    var ctitle:String = ""
    var cicon:String = ""
    var chandler: CDHandler? = nil
    
    /// init method
    ///
    /// - Parameters:
    ///   - title: title
    ///   - icon: icon name
    ///   - hanlder: closure
    /// - Returns:CDShareItem
    public class func cdinit(title: String, icon: String, hanlder: @escaping CDHandler) -> CDShareItem {
        let item = CDShareItem()
        item.ctitle = title
        item.cicon = icon
        item.chandler = hanlder
        return item
    }
}
