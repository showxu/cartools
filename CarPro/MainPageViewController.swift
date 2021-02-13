//
//  MainPageViewController.swift
//  Cartools
//
//  Created by Xudong Xu on 1/14/21.
//

import Cocoa
import Combine
import CartoolKit

class MainPageViewController: NSSplitViewController {
    
    private var sidebar: SidebarViewController! {
        splitViewItems[0].viewController as? SidebarViewController
    }
    
    private var renditionCollection: RenditionCollectionViewController! {
        splitViewItems[1].viewController as? RenditionCollectionViewController
    }
    
    private var rendition: RenditionViewController! {
        splitViewItems[2].viewController as? RenditionViewController
    }
    
    var interactor: MainPageInteractor! {
        didSet {
            combine()
        }
    }

    private var disposeBag: Set<AnyCancellable> = .init()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        build()
    }
    
    private func build() {
        let dp0 = CollectionViewDataProvider<SidebarViewItem, SidebarCategory>(.sidebarItem, sidebar.collectionView)
        dp0.itemForRepresentedObjectAtIndexPath = { _, indexPath, viewItem, dataItem in
            viewItem.iconView.image = NSImage(systemSymbolName: dataItem.symbol, accessibilityDescription: nil)
            viewItem.label.stringValue = dataItem.name
        }
        dp0.didSelectItemsAtIndexPaths = { [weak self] _, indexPaths, dataItems in
            self?.interactor.renditionPredicate.value = dataItems.first?.label ?? ""
        }
        dp0.dataSource = SidebarCategory.rendition
        sidebar.dataProvider = dp0

        let dp1 = CollectionViewDataProvider<RenditionViewItem, LazyRendition>(.renditionItem, renditionCollection.collectionView)
        dp1.itemForRepresentedObjectAtIndexPath = { _, indexPath, viewItem, dataItem in
            viewItem.label.stringValue = dataItem.name
            viewItem.vectorView.isHidden = !dataItem.isVector
            viewItem.thumbnailImageView.image = dataItem.unsafeCreatedNSImage
        }
        dp1.pasteboardWriterForItemAtIndexPath = { _, indexPath, dataItem in
            try dataItem.writeTo(.init(fileURLWithPath: NSTemporaryDirectory())) as NSURL
        }
        dp1.didSelectItemsAtIndexPaths = { [weak self] _, indexPaths, dataItems in
            self?.interactor.focusOn.send(dataItems.first)
        }
        renditionCollection.dataProvider = dp1
    }
    
    private func combine() {
        disposeBag
            .forEach { $0.cancel() }
        
        interactor.filtered
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in}, receiveValue: { [weak self] in
                (self?.renditionCollection.dataProvider as? CollectionViewDataProvider<RenditionViewItem, LazyRendition>)?.dataSource = $0
            })
            .store(in: &disposeBag)
        
        interactor.focusOn
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                self?.rendition.rendition = $0
            }.store(in: &disposeBag)
        
        interactor.read()
    }
    
    @IBAction func search(_ sender: NSSearchField) {
        interactor.namePredicate.value = sender.stringValue
    }
    
    @IBAction func collapseFirst(_ sender: NSToolbarItem) {
        splitViewItems.first.map(collapse)
    }
    
    @IBAction func collapseLast(_ sender: NSToolbarItem) {
        splitViewItems.last.map(collapse)
    }
    
    private func collapse(_ item: NSSplitViewItem) {
        item.animator().isCollapsed = !item.isCollapsed
    }
}
