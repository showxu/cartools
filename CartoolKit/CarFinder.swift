//
//  CarFinder.swift
//  CartoolKit
//
//  Created by Xudong Xu on 1/8/21.
//

extension Car {

    struct Finder {

        static func find(_ candidateURL: URL) throws -> [Car] {
            guard
                let bundle = Bundle(url: candidateURL),
                let fileURL = bundle.url(forResource: "Assets", withExtension: "car") else {
                return [.init(uiCatalogName: candidateURL.lastPathComponent, url: candidateURL)]
            }
            
            let uiCatalogName = "\(bundle.bundleURL.lastPathComponent) | \(fileURL.lastPathComponent)"
            return [.init(uiCatalogName: uiCatalogName, url: fileURL)]
        }
    }
}
