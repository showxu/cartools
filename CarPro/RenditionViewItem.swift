//
//  RenditionViewItem.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 1/11/21.
//

import Cocoa
import Quartz
import Combine

extension NSUserInterfaceItemIdentifier {
    
    static let renditionItem = NSUserInterfaceItemIdentifier("RenditionViewItem")
}

class RenditionViewItem: NSCollectionViewItem {
    
    static let nibName = NSUserInterfaceItemIdentifier.renditionItem.rawValue
    
    private struct Appearance {
        static let border = NSColor(white: 0.9, alpha: 1.0)
        static let background = NSColor(red: 199.0/255, green: 199.0/255, blue: 203.0/255, alpha: 1)
        static let selectedBackground = NSColor(red: 41.0/255, green: 97.0/255, blue: 217.0/255, alpha: 1)
    }
    
    @IBOutlet var boarderView: NSView! {
        didSet {
            boarderView.wantsLayer = true
            boarderView.layer?.borderColor = Appearance.border.cgColor
            boarderView.layer?.borderWidth = 1
            boarderView.layer?.cornerRadius = 5
            boarderView.layer?.masksToBounds = true
        }
    }
    
    @IBOutlet var thumbnailImageView: NSImageView!
    
    @IBOutlet var vectorView: NSView! {
        didSet {
            vectorView.wantsLayer = true
            vectorView.layer?.backgroundColor = NSColor.black.withAlphaComponent(0.75).cgColor
            vectorView.layer?.cornerRadius = 5
            vectorView.layer?.masksToBounds = true
        }
    }
    
    @IBOutlet var label: NSTextField!
    
    private var disposeBag: Set<AnyCancellable> = .init()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        combine()
    }
    
    private func combine() {
        publisher(for: \.isSelected)
            .share()
            .sink { [weak self] in
                self?.boarderView.layer?.backgroundColor = $0 ? Appearance.selectedBackground.cgColor : NSColor.clear.cgColor
            }
            .store(in: &disposeBag)
    }
} 
