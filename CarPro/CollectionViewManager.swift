//
//  CollectionViewManager.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 1/11/21.
//

import Cocoa
import CartoolKit

private extension NSPasteboard {
    
    var filenamesPropertyList: [String] {
        set {
            setPropertyList(newValue, forType: .fileContents)
        } get {
            propertyList(forType: .fileContents) as? [String] ?? []
        }
    }
}

private extension NSUserInterfaceItemIdentifier {
    
    static let collectionViewItemIdentifier = NSUserInterfaceItemIdentifier("collectionViewItem")
}

class CollectionViewManager: NSObject, NSCollectionViewDataSource, NSCollectionViewDelegate {
    
    private struct Constants {
        static let nibName = "CollectionViewItem"
    }
    
    var collectionView: NSCollectionView! {
        didSet {
            collectionView.setDraggingSourceOperationMask(.every, forLocal: false)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.collectionViewLayout = FlowLayout()
            
            let nib = NSNib(nibNamed: Constants.nibName, bundle: nil)
            collectionView.register(nib, forItemWithIdentifier: .collectionViewItemIdentifier)
        }
    }
    
    var dataSource: [LazyRendition] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
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
        let item = collectionView.makeItem(withIdentifier: .collectionViewItemIdentifier, for: indexPath) as! CollectionViewItem
        let element = dataSource[indexPath.item]
        item.label.stringValue = element.name
        item.thumbnailImageView.image = element.unsafeUnslicedNSImage
        return item
    }
    
    func collectionView(_ collectionView: NSCollectionView, pasteboardWriterForItemAt indexPath: IndexPath) -> NSPasteboardWriting? {
        let element = dataSource[indexPath.item]
        let fileURL = URL(fileURLWithPath: "\(NSTemporaryDirectory())\(element.name)")
        try! element.unsafeUnslicedNSImage?.tiffRepresentation?.write(to: fileURL,
                                                                options: .atomicWrite)
        return fileURL as NSURL
    }
}
