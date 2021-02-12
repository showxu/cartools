//
//  CoreUIExt.swift
//  CoreUIExt
//
//  Created by Xudong Xu on 1/11/21.
//

import Cocoa
import CoreUI
import CoreGraphics

extension CUIRenditionKey {
    
    enum ThemePresentationState: Int, CustomStringConvertible {
        case nomal = 0
        case rollover
        case pressed
        case inactive
        case disabled
        case deeplyPressed
        case none = -1
        
        var description: String {
            return [
                0: "Normal",
                1: "Rollover",
                2: "Pressed",
                3: "Inactive",
                4: "Disabled",
                5: "DeeplyPressed"
            ][rawValue] ?? "Invalid"
        }
    }
    
    var presentationState: ThemePresentationState {
        ThemePresentationState(rawValue: Int(themeState)) ?? .none
    }
}

extension CUIThemeRendition {
    
    var isPDFRendition: Bool {
        className == "_CUIThemePDFRendition"
    }
    
    var isSVGRendition: Bool {
        className == "_CUIThemeSVGRendition"
    }
    
    var isMultisizeImageSetRendition: Bool {
        className == "_CUIThemeMultisizeImageSetRendition"
    }
        
    var isPackedAsset: Bool {
        name()?.contains("ZZPackedAsset") ?? false
    }
    
    func createImage() -> CGImage? {
        if isPDFRendition {
            // pdf
            return createImageFromPDFRendition(withScale: scale())?.takeUnretainedValue()
            
        } else if isSVGRendition {
            // svg
            let w = Int(ceil(CGSVGDocumentGetCanvasSize(svgDocument()).width))
            let h = Int(ceil(CGSVGDocumentGetCanvasSize(svgDocument()).height))
            let c = CGContext(data: nil,
                              width: w,
                              height: h,
                              bitsPerComponent: 8,
                              bytesPerRow: 0,
                              space: CGColorSpaceCreateDeviceRGB(),
                              bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)
            CGContextDrawSVGDocument(c, svgDocument())
            return c?.makeImage()
            
        } else if isMultisizeImageSetRendition {
            // AppIcon
            // case "_CUIThemeMultisizeImageSetRendition":
            return nil
            
        } else {
            // png, jpeg, linked svg, linked pdf
            // case "_CUIInternalLinkRendition", "_CUIThemePixelRendition":
            return unslicedImage()?.takeUnretainedValue()
        }
    }
}

extension CUICatalog {
    
    var allAssetCount: Int {
        _themeStore().themeStore().allAssetKeys().count
    }
    
    var allAssetKeys: [CUIRenditionKey] {
        _themeStore().themeStore().allAssetKeys()
    }

    var hasRetina: Bool {
        var hasRetina = false
        for name in allImageNames() where !hasRetina {
            for namedImage in images(withName: name) where !hasRetina {
                if namedImage.scale > 1 {
                    hasRetina = true
                    break
                }
            }
        }
        return hasRetina
    }
}
