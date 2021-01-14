//
//  Car.swift
//  CartoolKit
//
//  Created by Xudong Xu on 1/8/21.
//

import Cocoa
import CoreUI

public struct Car {
    
    public var uiCatalogName: String
    public var url: URL
    
    public init(uiCatalogName: String, url: URL) {
        self.uiCatalogName = uiCatalogName
        self.url = url
    }
}
