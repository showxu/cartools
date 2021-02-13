//
//  SVG.swift
//  CartoolKit
//
//  Created by Xudong Xu on 2/12/21.
//

import CoreFoundation
import CoreUI

let CGSVGDocumentWriteToData: @convention(c) (UnsafeMutablePointer<CGSVGDocument>?, CFData?, CFDictionary?) -> Void = {
    let RTLD_DEFAULT = UnsafeMutablePointer<Any>(bitPattern: -2)
    var writeToData = "CGSVGDocumentWriteToData".cString(using: .utf8)!
    return unsafeBitCast(dlsym(RTLD_DEFAULT, &writeToData), to: (@convention(c) (UnsafeMutablePointer<CGSVGDocument>?, CFData?, CFDictionary?) -> Void).self);
}()

let CGSVGDocumentWriteToURL: @convention(c) (UnsafeMutablePointer<CGSVGDocument>?, CFURL?, CFDictionary?) -> Void = {
    let RTLD_DEFAULT = UnsafeMutablePointer<Any>(bitPattern: -2)
    var writeToData = "CGSVGDocumentWriteToURL".cString(using: .utf8)!
    return unsafeBitCast(dlsym(RTLD_DEFAULT, &writeToData), to: (@convention(c) (UnsafeMutablePointer<CGSVGDocument>?, CFURL?, CFDictionary?) -> Void).self);
}()

let CGContextDrawSVGDocument: @convention(c) (CGContext?, UnsafeMutablePointer<CGSVGDocument>?) -> Void = {
    let RTLD_DEFAULT = UnsafeMutablePointer<Any>(bitPattern: -2)
    var writeToData = "CGContextDrawSVGDocument".cString(using: .utf8)!
    return unsafeBitCast(dlsym(RTLD_DEFAULT, &writeToData), to: (@convention(c) (CGContext?, UnsafeMutablePointer<CGSVGDocument>?) -> Void).self);
}()

let CGSVGDocumentGetCanvasSize: @convention(c) (UnsafeMutablePointer<CGSVGDocument>?) -> CGSize = {
    let RTLD_DEFAULT = UnsafeMutablePointer<Any>(bitPattern: -2)
    var writeToData = "CGSVGDocumentGetCanvasSize".cString(using: .utf8)!
    return unsafeBitCast(dlsym(RTLD_DEFAULT, &writeToData), to: (@convention(c) (UnsafeMutablePointer<CGSVGDocument>?) -> CGSize).self);
}()
