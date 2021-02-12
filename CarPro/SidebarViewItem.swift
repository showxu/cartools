//
//  SidebarViewItem.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 2/12/21.
//

import Cocoa
import Quartz
import Combine

extension NSUserInterfaceItemIdentifier {
    
    static let sidebarItem = NSUserInterfaceItemIdentifier("SidebarViewItem")
}

class SidebarViewItem: NSCollectionViewItem {

    static let nibName = NSUserInterfaceItemIdentifier.sidebarItem.rawValue
    
    private struct Appearance {
        static let background = NSColor(named: "SidebarViewItemBackground")!
    }
    
    @IBOutlet var backgroundView: NSView! {
        didSet {
            backgroundView.wantsLayer = true
            backgroundView.layer?.backgroundColor = Appearance.background.cgColor
            backgroundView.layer?.cornerRadius = 5
            backgroundView.layer?.masksToBounds = true
        }
    }
    
    @IBOutlet var iconView: NSImageView!
    
    @IBOutlet var label: NSTextField!
    
    private var disposeBag: Set<AnyCancellable> = .init()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        combine()
    }
    
    private func combine() {
        publisher(for: \.isSelected)
            .share()
            .sink { [weak self] _ in
            }
            .store(in: &disposeBag)
    }
}
