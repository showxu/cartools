//
//  DocumentController.swift
//  Cartools
//
//  Created by show on 1/13/21.
//

import Cocoa

class DocumentController: NSDocumentController {
    
    override func newDocument(_ sender: Any?) {
        // the app doesn't support creating new documents
    }
    
    override func saveAllDocuments(_ sender: Any?) {
        // the app doesn't support saving documents
    }
    
    override func openDocument(_ sender: Any?) {
        super.openDocument(sender)
    }
    
    private func makeAccessoryView() -> NSView? {
        nil
    }
    

    override func runModalOpenPanel(_ openPanel: NSOpenPanel, forTypes types: [String]?) -> Int {
        openPanel.allowedFileTypes = ["car", "app", "framework", "bundle", "plugin"]
        openPanel.treatsFilePackagesAsDirectories = true
        openPanel.accessoryView = makeAccessoryView()
        return openPanel.runModal().rawValue
    }
}
