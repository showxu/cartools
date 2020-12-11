//
//  Document.swift
//  Cartools
//
//  Created by show on 1/13/21.
//

import Cocoa
import CartoolKit

class Document: NSDocument {

    private var reader: Car.Reader<LazyRendition>!
    /*
    override var windowNibName: String? {
        // Override returning the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
        return "Document"
    }
    */

    override func windowControllerDidLoadNib(_ aController: NSWindowController) {
        super.windowControllerDidLoadNib(aController)
        // Add any code here that needs to be executed once the windowController has loaded the document's window.
    }
    
    override func makeWindowControllers() {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let windowController = storyboard.instantiateController(withIdentifier: "MainWindowController") as? NSWindowController else {
            return
        }
        addWindowController(windowController)
        ((windowController.contentViewController as? NSSplitViewController)?.splitViewItems[1].viewController as? RenditionViewController)?.reader = reader
        if #available(OSX 10.12, *) {
            windowController.window?.tabbingIdentifier = "MainWindow"
            windowController.window?.tabbingMode = .preferred
        }
        NotificationCenter.default.addObserver(forName: NSWindow.willCloseNotification, object: windowController.window, queue: OperationQueue.main) { _ in
            
        }
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override fileWrapper(ofType:), write(to:ofType:), or write(to:ofType:for:originalContentsURL:) instead.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }
    
    override func read(from url: URL, ofType typeName: String) throws {
        reader = Car.Reader(.init(uiCatalogName: "", url: url))
    }
    
    override class var autosavesInPlace: Bool {
        return true
    }
}
