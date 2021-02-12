//
//  RenditionCollectionDataProvider.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 1/11/21.
//

import Cocoa

class CollectionViewDataProvider<ViewItem: NSCollectionViewItem, DataItem>: NSObject, NSCollectionViewDelegate, NSCollectionViewDataSource {
    
    var userInfo: [String: Any] = [:]
    
    var itemForRepresentedObjectAtIndexPath: ((_ collectionView: NSCollectionView, _ indexPath: IndexPath, _ viewItem: ViewItem, _ dataItem: DataItem) -> Void)?
    var didSelectItemsAtIndexPaths: ((_ collectionView: NSCollectionView, _ indexPaths: Set<IndexPath>, _ dataItems: [DataItem]) -> Void)?
    var pasteboardWriterForItemAtIndexPath: ((_ collectionView: NSCollectionView,  _ indexPath: IndexPath, _ dataItem: DataItem) throws -> NSPasteboardWriting)?
    
    init(_ identifier: NSUserInterfaceItemIdentifier, _ collectionView: NSCollectionView) {
        self.identifier = identifier
        self.collectionView = collectionView
    }
    
    private(set) var identifier: NSUserInterfaceItemIdentifier
    
    private(set) var collectionView: NSCollectionView! {
        didSet {
            collectionView.setDraggingSourceOperationMask(.every, forLocal: false)
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    
    var dataSource: [DataItem] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
            }
        }
    }

    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let viewItem = collectionView.makeItem(withIdentifier: identifier, for: indexPath) as! ViewItem
        let dataItem = dataSource[indexPath.item]
        itemForRepresentedObjectAtIndexPath?(collectionView, indexPath, viewItem, dataItem)
        return viewItem
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        didSelectItemsAtIndexPaths?(collectionView, indexPaths, indexPaths.map { dataSource[$0.item] })
    }
    
    func collectionView(_ collectionView: NSCollectionView, pasteboardWriterForItemAt indexPath: IndexPath) -> NSPasteboardWriting? {
        let dataItem = dataSource[indexPath.item]
        return try? pasteboardWriterForItemAtIndexPath?(collectionView, indexPath, dataItem)
    }
}
