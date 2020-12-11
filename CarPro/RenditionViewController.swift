//
//  RenditionViewController.swift
//  Final Car Pro
//
//  Created by show on 1/12/21.
//

import Cocoa
import CartoolKit

class RenditionViewController: NSViewController {
    
    @IBOutlet var collectionView: NSCollectionView!
    
    @IBOutlet var viewManager: CollectionViewManager!
    
    var reader: Car.Reader<LazyRendition>! {
        didSet {
            _read(reader)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewManager.collectionView = collectionView
    }
    
    private func _read(_ reader: Car.Reader<LazyRendition>) {
        reader.read { result in
            switch result {
            case let .success(elements):
                self.viewManager.dataSource = elements
            case .failure(_):
                break
            }
        }
    }
}
