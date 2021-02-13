//
//  SidebarViewController.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 1/11/21.
//

import Cocoa

class SidebarViewController: NSViewController {
    
    private struct Layout {
        static let height: CGFloat = 28
        static let minimumInteritemSpacing: CGFloat = 0
        static let minimumLineSpacing: CGFloat = 0
        static let sectionInset: NSEdgeInsets = .init(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    @IBOutlet var collectionView: NSCollectionView! {
        didSet {
            let nib = NSNib(nibNamed: SidebarViewItem.nibName, bundle: nil)
            collectionView.register(nib, forItemWithIdentifier: .sidebarItem)
            collectionView.collectionViewLayout = SidebarLayout(
                height: Layout.height,
                minimumInteritemSpacing: Layout.minimumInteritemSpacing,
                minimumLineSpacing: Layout.minimumLineSpacing,
                sectionInset: Layout.sectionInset)
        }
    }
    
    var dataProvider: (NSCollectionViewDataSource & NSCollectionViewDelegate)! {
        didSet {
            collectionView.dataSource = dataProvider
            collectionView.delegate = dataProvider
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
