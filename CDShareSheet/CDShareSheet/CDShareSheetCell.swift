//
//  CDShareSheetCell.swift
//  CDShareSheet
//
//  Created by chardxu on 2019/4/8.
//  Copyright © 2019 chardxu. All rights reserved.
//

import UIKit

class CDShareSheetCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    class func cell(tableView: UITableView) -> CDShareSheetCell {
        let cell = CDShareSheetCell.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "CDShareSheetCell")
        return cell
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.backgroundColor = nil
        
        let collV = UICollectionView.init(frame: self.bounds, collectionViewLayout: self.flowLayout)
        collV.alwaysBounceHorizontal = true
        collV.showsHorizontalScrollIndicator = false
        collV.delegate = self
        collV.dataSource = self
        collV.backgroundColor = nil
        collV.register(CDShareItemCell.self, forCellWithReuseIdentifier: "CDShareItemCell")
        self.collectionV = collV
        self.addSubview(self.collectionV!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.collectionV!.frame = self.bounds
    }
    
    var flowLayout:UICollectionViewFlowLayout = {
        var layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.scrollDirection = UICollectionView.ScrollDirection.horizontal
        layout.itemSize = CGSize(width: CD_ITEMCELL_WIDTH, height: CD_ITEMCELL_HEIGHT)
        return layout
    }()
    
    var collectionV:UICollectionView?
    
    var items:Array<CDShareItem> = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CDShareItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CDShareItemCell", for: indexPath) as! CDShareItemCell
        let item:CDShareItem = self.items[indexPath.row]
        cell.item = item
        return cell
    }
    
}
