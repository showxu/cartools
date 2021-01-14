//
//  RenditionViewController.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 1/12/21.
//

import Cocoa
import CartoolKit

class RenditionViewController: NSViewController {
    
    @IBOutlet var collectionView: NSCollectionView!
    
    @IBOutlet var viewManager: CollectionViewManager!
    
    var reader: Car.Reader<LazyRendition>! {
        didSet {
            perfromRead(reader)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewManager.collectionView = collectionView
    }
    
    private func perfromRead(_ reader: Car.Reader<LazyRendition>) {
        reader.read { [weak self] result in
            guard let self = self else { return }
            switch result {
            case let .success(elements):
                self.viewManager.dataSource = elements
            case .failure(_):
                break
            }
        }
    }
}
