//
//  CoreUIExt.swift
//  CoreUIExt
//
//  Created by show on 1/11/21.
//

import Cocoa
import CoreUI

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
    
    var hasPackedAsset: Bool {
        name()?.contains("ZZPackedAsset") ?? false
    }
    
    var strippedName: String {
        .init((name() as NSString).deletingPathExtension.split(separator: "@").first ?? "")
    }

    func preferredName(_ name: String, scale: Int, themePresentationState: Int64) -> String {
        typealias State = CUIRenditionKey.ThemePresentationState
        
        let scale = Int(scale)
        return "\(name)\(themePresentationState != State.none.rawValue ? "_\(State(rawValue: Int(themePresentationState))!)": "")\(scale > 1 ? "\(scale).0fx" : "").png"
    }
    
    func unslicedImage() -> CGImage? {
        unslicedImage()?.takeUnretainedValue()
    }
    
    func unslicedImageRep() -> NSBitmapImageRep? {
        guard let unsliced: CGImage = unslicedImage() else {
            return nil
        }
        let rep = NSBitmapImageRep(cgImage: unsliced)
        rep.size = CGSize(width: unsliced.width, height: unsliced.height)
        return rep
    }
}

extension CUICatalog {
    
    var totalCount: Int {
        _themeStore().themeStore().allAssetKeys().count
    }
    
    var allAssetKeys: [CUIRenditionKey] {
        _themeStore().themeStore().allAssetKeys()
    }

    func images(withName aName: String) -> [CUINamedImage] {
         (1...3).compactMap {
            let scaleFactor = Double($0)
            guard let image = self.image(withName: aName, scaleFactor: scaleFactor) else {
                return nil
            }
            return image.scale != scaleFactor ? nil : image
        }
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
