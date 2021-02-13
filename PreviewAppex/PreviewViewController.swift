//
//  PreviewViewController.swift
//  CarPreview
//
//  Created by Xudong Xu on 12/11/20.
//

import Cocoa
import Quartz
import CartoolKit

class PreviewViewController: NSViewController, QLPreviewingController {
    
    private var reader: Reader<LazyRendition>!
    
    override var nibName: NSNib.Name? {
        "PreviewViewController"
    }

    override func loadView() {
        super.loadView()
        // Do any additional setup after loading the view.
    }

    func preparePreviewOfSearchableItem(identifier: String, queryString: String?, completionHandler handler: @escaping (Error?) -> Void) {
        // Perform any setup necessary in order to prepare the view.
        
        // Call the completion handler so Quick Look knows that the preview is fully loaded.
        // Quick Look will display a loading spinner while the completion handler is not called.
        handler(nil)
    }

    func preparePreviewOfFile(at url: URL, completionHandler handler: @escaping (Error?) -> Void) {
        // Add the supported content types to the QLSupportedContentTypes array in the Info.plist of the extension.
        
        // Perform any setup necessary in order to prepare the view.
        
        // Call the completion handler so Quick Look knows that the preview is fully loaded.
        // Quick Look will display a loading spinner while the completion handler is not called.
        do {
            try reader = .init(.init(url))
            try _ = reader.read()
        } catch {
            handler(error)
        }
    }
}
