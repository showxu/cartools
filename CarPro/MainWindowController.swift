//
//  MainWindowController.swift
//  CarPro
//
//  Created by Xudong Xu on 1/11/21.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    @IBOutlet weak var searchField: NSSearchField!
    
    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
}

extension MainWindowController: NSToolbarDelegate {
    
    func toolbarWillAddItem(_ notification: Notification) {
        let item = (notification.userInfo?["item"] as? NSToolbarItem)
        if !(item?.view is NSSearchField) {
            item?.isBordered = true
        }
    }
}
