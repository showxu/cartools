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
    }
    
    @IBOutlet var iconView: NSImageView!
    
    @IBOutlet var label: NSTextField!
    
    private var disposeBag: Set<AnyCancellable> = .init()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        combine()
        view.cornerRadius = 5
        view.masksToBounds = true
    }
    
    private func combine() {
        publisher(for: \.isSelected)
            .share()
            .sink { [weak self] newValue in
                self?.iconView?.contentTintColor = newValue ? NSColor.white : NSColor.systemBlue
                self?.label.textColor = newValue ? NSColor.white : NSColor.labelColor
                self?.view.backgroundColor = !newValue ? .clear : .systemBlue
            }
            .store(in: &disposeBag)
    }
}
