//
//  Unarchiver.swift
//  Cartools
//
//  Created by Xudong Xu on 1/7/20.
//

import Cocoa
import CartoolKit

@objcMembers class Unarchiver: NSObject {
    
    private var _readers: [(filerURL: URL, reader: Car.Reader<Rendition>)]!
    
    @objc public func unarchive(_ pboard: NSPasteboard!, userData: String!, error: AutoreleasingUnsafeMutablePointer<NSString?>) {
        guard
            let fileURLs = pboard.readObjects(forClasses: [NSURL.self]) as? [URL]
        else {
            return error.pointee = "Invalid NSPasteboard input file paths."
        }
        do {
            _readers = try fileURLs.map {
                try ($0, Car.Reader(.init(uiCatalogName: "", url: $0)))
            }
            try _readers.map {
                try (fileURL: $0.filerURL, renditions: $0.reader.read())
            }.forEach {
                let providedURL = $0.fileURL.deletingPathExtension()
                try $0.renditions.forEach {
                    try $0.writeTo(providedURL)
                }
            }
        } catch let anError {
            error.pointee = anError.localizedDescription as NSString
        }
    }
}