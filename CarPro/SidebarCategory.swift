//
//  SidebarCategory.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 2/13/21.
//

import Foundation

struct SidebarCategory: Codable {
    var name: String
    var symbol: String
    var label: String
}

extension SidebarCategory {
    
    static let `default` = [
        (name: "All", symbol: "square.grid.2x2", label: ""),
        (name: "Pixel", symbol: "photo.on.rectangle.angled", label: "CUIThemePixelRendition"),
        (name: "Internal Link", symbol: "link.circle", label: "CUIInternalLinkRendition"),
        (name: "PDF", symbol: "doc", label: "CUIThemePDFRendition"),
        (name: "SVG", symbol: "doc.text", label: "CUIThemeSVGRendition"),
        (name: "Multisize ImageSet", symbol: "doc.on.doc", label: "CUIThemeMultisizeImageSetRendition"),
    ].map(SidebarCategory.init)
}
