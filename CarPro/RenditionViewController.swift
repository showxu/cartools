//
//  RenditionViewController.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 2/11/21.
//

import Cocoa
import CartoolKit

class RenditionViewController: NSViewController {
    
    @IBOutlet var decorateView: NSView! {
        didSet {
            decorateView.wantsLayer = true
            decorateView.layer?.backgroundColor = .white
            decorateView.layer?.cornerRadius = 8
            decorateView.layer?.masksToBounds = true
        }
    }
    
    @IBOutlet var renditionView: NSImageView!
    @IBOutlet var nameField: NSTextField!
    
    @IBOutlet var renditionTitleView: NSView!
    @IBOutlet var renditionField: NSTextField!
    
    @IBOutlet var renditionClassField: NSTextField!
    @IBOutlet var scaleField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension RenditionViewController {
    
    var rendition: LazyRendition! {
        set {
            renditionView.image = newValue?.unsafeCreatedNSImage
            nameField.stringValue = newValue?.fileName ?? ""
            renditionField.stringValue = newValue?.renditionName ?? ""
            renditionClassField.stringValue = newValue?.renditionClass ?? ""
            scaleField.stringValue = newValue == nil ? "" : "\(newValue!.scale)"
            
            renditionTitleView.isHidden = newValue?.renditionName.isEmpty ?? false
            renditionField.isHidden = newValue?.renditionName.isEmpty ?? false
        } get {
            return nil
        }
    }
}
