//
//  MainWindowController.swift
//  CarPro
//
//  Created by Xudong Xu on 1/11/21.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    @IBOutlet weak var searchField: NSSearchField!
    
    @IBAction fileprivate func enableSearchField(_ sender: AnyObject?) {
        searchField.isEnabled = true
    }
    
    @IBAction fileprivate func disableSearchField(_ sender: AnyObject?) {
        searchField.isEnabled = false
    }

    override func windowDidLoad() {
        super.windowDidLoad()
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
}
