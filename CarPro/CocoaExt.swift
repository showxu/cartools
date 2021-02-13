//
//  CocoaExt.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 2/12/21.
//

import Cocoa

extension NSView {
    
    var cornerRadius: CGFloat {
        set {
            wantsLayer = true
            layer?.cornerRadius = newValue
        } get {
            return layer?.cornerRadius ?? 0
        }
    }
    
    var masksToBounds: Bool {
        set {
            wantsLayer = true
            layer?.masksToBounds = true
        } get {
            return layer?.masksToBounds ?? false
        }
    }
    
    @IBInspectable var backgroundColor: NSColor? {
        set {
            wantsLayer = true
            layer?.backgroundColor = newValue?.cgColor
        } get {
            layer?.backgroundColor.flatMap(NSColor.init(cgColor:))
        }
    }
}
