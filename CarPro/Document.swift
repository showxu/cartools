//
//  Document.swift
//  Cartools
//
//  Created by Xudong Xu on 1/13/21.
//

import Cocoa
import CartoolKit

class Document: NSDocument {

    private var reader: Reader<LazyRendition>!
 
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
        (windowController.contentViewController as? MainPageViewController)?.interactor = .init(reader: reader)
        NotificationCenter.default.addObserver(forName: NSWindow.willCloseNotification,
                                               object: windowController.window,
                                               queue: OperationQueue.main) { _ in }
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override fileWrapper(ofType:), write(to:ofType:), or write(to:ofType:for:originalContentsURL:) instead.
        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
    }
    
    override func read(from url: URL, ofType typeName: String) throws {
        reader = try Reader(.init(url))
    }
    
    override func writeSafely(to url: URL, ofType typeName: String, for saveOperation: NSDocument.SaveOperationType) throws {
        try reader.read().forEach { try $0.writeTo(url) }
    }
    
    override class var autosavesInPlace: Bool {
        return true
    }
}
