//
//  Rendition.swift
//  CartoolKit
//
//  Created by Xudong Xu on 1/11/21.
//

import Cocoa
import CoreUI

public class LazyRendition: Rendition {
    
    private var _unslicedNSImageStore: NSImage? = nil
    
    public var unslicedNSImage: NSImage? {
        get {
            guard let _ = _unslicedNSImageStore else {
    //            _unslicedNSImageStore = unsafeUnslicedImage().map { ($0, .zero) }.map(NSImage.init(cgImage:size:))
                _unslicedNSImageStore = unsafeUnslicedImageRep()?.data().flatMap(NSImage.init(data:))
                return _unslicedNSImageStore
            }
            return _unslicedNSImageStore
        } set {
            _unslicedNSImageStore = newValue
        }
    }
}

public class Rendition {
    
    public var name: String {
        _internalRendition.name()
    }
        
    public var internalName: String {
        _internalRendition.internalName
    }
    
    public var scale: Int {
        Int(_internalRendition.scale())
    }
    
    public internal(set) var unslicedImage: CGImage?
        
    internal var _internalRendition: CUIThemeRendition
    
    required init(_ rendition: CUIThemeRendition) {
        _internalRendition = rendition
    }
    
    public func unsafeUnslicedImageRep() -> NSBitmapImageRep? {
        guard let unsliced: CGImage = unsafeUnslicedImage() else {
            return nil
        }
        let rep = NSBitmapImageRep(cgImage: unsliced)
        rep.size = CGSize(width: unsliced.width, height: unsliced.height)
        return rep
    }
    
    public func unsafeUnslicedImage() -> CGImage? {
        _internalRendition.unslicedImage()
    }
}
