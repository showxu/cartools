//
//  SidebarViewController.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 1/11/21.
//

import Cocoa
import CoreUI

class SidebarViewController: NSViewController {
    
    @IBOutlet var collectionView: NSCollectionView! {
        didSet {
            let nib = NSNib(nibNamed: SidebarViewItem.nibName, bundle: nil)
            collectionView.register(nib, forItemWithIdentifier: .sidebarItem)
            collectionView.collectionViewLayout = SidebarLayout(
                height: 40,
                minimumInteritemSpacing: 0,
                minimumLineSpacing: 0,
                sectionInset: .init())
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
        // Do any additional setup after loading the view.
    }
}
