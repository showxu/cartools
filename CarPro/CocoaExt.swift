//
//  CocoaExt.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 2/12/21.
//

import Cocoa

extension NSView {
    
    @IBInspectable var backgroundColor: NSColor? {
        get {
            layer?.backgroundColor.flatMap(NSColor.init(cgColor:))
        } set {
            wantsLayer = true
            layer?.backgroundColor = newValue?.cgColor
        }
    }
}
