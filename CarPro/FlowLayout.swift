//
//  FlowLayout.swift
//  Final Car Pro
//
//  Created by show on 1/11/21.
//

import Cocoa

class FlowLayout: NSCollectionViewFlowLayout {

    fileprivate struct Constants {
        static let itemWidth: CGFloat = 100
        static let itemHeight: CGFloat = 120
        static let minimumInteritemSpacing: CGFloat = 20
        static let minimumLineSpacing: CGFloat = 20
    }
    
    override init() {
        super.init()
        itemSize = .init(width: Constants.itemWidth, height: Constants.itemHeight)
        minimumInteritemSpacing = Constants.minimumInteritemSpacing
        minimumLineSpacing = Constants.minimumLineSpacing
        sectionInset = .init(top: Constants.minimumLineSpacing,
                             left: Constants.minimumInteritemSpacing,
                             bottom: Constants.minimumLineSpacing,
                             right: Constants.minimumInteritemSpacing)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutAttributesForItem(at indexPath: IndexPath) -> NSCollectionViewLayoutAttributes? {
        let attributes = super.layoutAttributesForItem(at: indexPath)
        attributes?.zIndex = (indexPath as NSIndexPath).item
        return attributes
    }
    
    override func layoutAttributesForElements(in rect: NSRect) -> [NSCollectionViewLayoutAttributes] {
        return super.layoutAttributesForElements(in: rect).map { attr in
            attr.indexPath.map {
                attr.zIndex = ($0 as NSIndexPath).item
                return attr
            } ?? attr
        }
    }
}
