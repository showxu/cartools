//
//  Rendition.swift
//  CartoolKit
//
//  Created by Xudong Xu on 1/11/21.
//

import Cocoa
import CoreUI
import UniformTypeIdentifiers

public class LazyRendition: Rendition {
    
    private var unsafeCreatedNSImageStore: NSImage? = nil
    
    public var unsafeCreatedNSImage: NSImage? {
        get {
            if unsafeCreatedNSImageStore == nil {
                unsafeCreatedNSImageStore = unsafeCreateImage()
                    .map { ($0, .zero) }
                    .map(NSImage.init(cgImage:size:))
            }
            return unsafeCreatedNSImageStore
        } set {
            unsafeCreatedNSImageStore = newValue
        }
    }
}

public class Rendition {

    public var fileName: String {
        internalRendition.name()
    }
        
    public var internalName: String {
        internalRendition.internalName
    }
    
    public var renditionClass: String {
        internalRendition.className.replacingOccurrences(of: "_", with: "")
    }
    
    public let renditionName: String
    
    public var scale: Int {
        Int(internalRendition.scale())
    }
    
    public var isVector: Bool {
        internalRendition.isVectorBased() && !internalRendition.isInternalLink()
    }
    
    public var isPDF: Bool {
        internalRendition.isPDFRendition
    }
    
    public var isLinkingToPDF: Bool {
        internalRendition.isInternalLink() && internalRendition.linkingTo().isPDFRendition
    }
    
    public var isSVG: Bool {
        internalRendition.isSVGRendition
    }
    
    public var isLinkingToSVG: Bool {
        internalRendition.isInternalLink() && internalRendition.linkingTo().isSVGRendition
    }
    
    internal var internalRendition: CUIThemeRendition
    
    required init(_ rendition: CUIThemeRendition, _ renditionName: String) {
        self.internalRendition = rendition
        self.renditionName = renditionName
    }
    
    public func unsafeCreateImage() -> CGImage? {
        let snapshot = internalRendition.createImage()
        return snapshot
    }
    
    public func unsafeCreateImageRep() -> NSBitmapImageRep? {
        guard let created: CGImage = unsafeCreateImage() else {
            return nil
        }
        let rep = NSBitmapImageRep(cgImage: created)
        rep.size = CGSize(width: created.width, height: created.height)
        return rep
    }
    
    @discardableResult
    public func writeTo(_ providedURL: URL, options: Data.WritingOptions = [.atomicWrite]) throws -> URL {
        var fileURL = providedURL
        if !renditionName.isEmpty {
            fileURL.appendPathComponent(renditionName)
        }
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            try FileManager.default.createDirectory(at: fileURL, withIntermediateDirectories: true, attributes: nil)
        }
        if scale > 1 {
            let file = URL(string: "file:///\(fileName)".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!)!
            let pathExtension = file.pathExtension
            fileURL.appendPathComponent("\(fileName.dropLast(pathExtension.count + 1))@\(scale)x.\(pathExtension)")
        } else {
            fileURL.appendPathComponent(fileName)
        }
        
        if isSVG {
            CGSVGDocumentWriteToURL(internalRendition.svgDocument(), fileURL as CFURL, nil)

        } else if isPDF {
            try internalRendition.srcData.map {
                try $0.write(to: fileURL, options: options)
            }
            
        } else {
            if fileURL.pathExtension != UTType.png.preferredFilenameExtension {
                fileURL.appendPathExtension(for: .png)
            }
            try unsafeCreateImageRep()?.data().map {
                try $0.write(to: fileURL, options: options)
            }
        }
        return fileURL
    }
}
