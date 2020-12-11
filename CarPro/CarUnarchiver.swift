//
//  CarUnarchiver.swift
//  Cartools
//
//  Created by Xudong Xu on 1/7/20.
//

import Cocoa

@objcMembers class CarUnarchiver: NSObject {
    
    @objc public func unarchive(_ pboard: NSPasteboard!, userData: String!, error: AutoreleasingUnsafeMutablePointer<NSString?>) {
        guard
            let fileURLs = pboard.readObjects(forClasses: [NSURL.self]) as? [URL],
            let filePath = fileURLs.first?.path
        else {
            // TODO: error handling
            return assertionFailure("Invalid NSPasteboard input file paths.")
        }
        
        if filePath.hasSuffix(".car") {
            // TODO: unarchive the file
        } else {
            // FIXME: error reason
            error.pointee = NSError().localizedFailureReason as NSString?
       }
    }
}
