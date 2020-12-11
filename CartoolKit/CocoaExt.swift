//
//  CocoaExt.swift
//  CartoolKit
//
//  Created by show on 1/12/21.
//

import Cocoa

public extension NSBitmapImageRep {
    
    func data(using fileType: FileType = .png, properties: [PropertyKey: Any] = [.interlaced : false]) -> Data? {
        representation(using: fileType, properties: properties)
    }
}
