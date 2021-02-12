//
//  RenditionCollectionLayout.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 1/11/21.
//

import Cocoa

extension NSCollectionViewLayout {
    
    static func flowLayout(width: CGFloat,
                           height: CGFloat,
                           minimumInteritemSpacing: CGFloat,
                           minimumLineSpacing: CGFloat) -> NSCollectionViewLayout {
        return NSCollectionViewFlowLayout.init(width: width,
                                               height: height,
                                               minimumInteritemSpacing: minimumInteritemSpacing,
                                               minimumLineSpacing: minimumLineSpacing)
    }
}

extension NSCollectionViewFlowLayout {
    
    convenience init(width: CGFloat, height: CGFloat, minimumInteritemSpacing: CGFloat, minimumLineSpacing: CGFloat) {
        self.init()
        self.scrollDirection = .vertical
        self.itemSize = .init(width: width, height: height)
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.sectionInset = .init(top: minimumLineSpacing,
                                  left: minimumInteritemSpacing,
                                  bottom: minimumLineSpacing,
                                  right: minimumInteritemSpacing)
    }
}
