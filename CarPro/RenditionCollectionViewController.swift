//
//  RenditionCollectionViewController.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 1/12/21.
//

import Cocoa

class RenditionCollectionViewController: NSViewController {
    
    fileprivate struct Layout {
        static let width: CGFloat = 100
        static let height: CGFloat = 120
        static let minimumInteritemSpacing: CGFloat = 20
        static let minimumLineSpacing: CGFloat = 20
    }
    
    @IBOutlet var collectionView: NSCollectionView! {
        didSet {
            let nib = NSNib(nibNamed: RenditionViewItem.nibName, bundle: nil)
            collectionView.register(nib, forItemWithIdentifier: .renditionItem)
            collectionView.collectionViewLayout = .flowLayout(
                width: Layout.width,
                height: Layout.height,
                minimumInteritemSpacing: Layout.minimumInteritemSpacing,
                minimumLineSpacing: Layout.minimumLineSpacing
            )
        }
    }
    
    var dataProvider: (NSCollectionViewDataSource & NSCollectionViewDelegate)! {
        didSet {
            collectionView.dataSource = dataProvider
            collectionView.delegate = dataProvider
        }
    }
}
