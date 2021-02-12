//
//  SidebarLayout.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 2/12/21.
//

import Cocoa

class SidebarLayout: NSCollectionViewFlowLayout {
    
    init(height: CGFloat,
         minimumInteritemSpacing: CGFloat,
         minimumLineSpacing: CGFloat,
         sectionInset: NSEdgeInsets) {
        super.init()
        self.itemSize = .init(width: height, height: height)
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = sectionInset
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let width = collectionView.frame.width - sectionInset.left - sectionInset.right
        itemSize = .init(width: width, height: itemSize.height)
    }
}
