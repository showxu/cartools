//
//  Reader.swift
//  CartoolKit
//
//  Created by Xudong Xu on 1/7/21.
//

import CoreThemeDefinition
import CoreUI
import Cocoa

public class Reader<T> where T: Rendition {

    public typealias CompletionHandler = (Result<[T], Error>) -> Void
    
    let car: Car
    
    private let catalog: CUICatalog
    
    public init(_ car: Car) throws {
        self.car = car
        self.catalog = try CUICatalog(url: car.url)
    }
    
    @discardableResult
    public func read(_ completion: CompletionHandler?) -> Self {
        DispatchQueue.global(qos: .default).async {
            do {
                try completion?(.success(self.read()))
            } catch {
                completion?(.failure(error))
            }
        }
        return self
    }
    
    public func read() throws -> [T] {
        guard
            try !isPro(self.car),
            let count = catalog.allImageNames()?.count,
            count != 0
        else {
            return []
        }
        return readTheme(catalog)
    }
    
    private func isPro(_ car: Car) throws -> Bool {
        let chars: [CChar] = [0x50, 0x72, 0x6F, 0x54, 0x68, 0x65, 0x6D, 0x65, 0x44, 0x65, 0x66, 0x69, 0x6E, 0x69, 0x74, 0x69, 0x6F, 0x6E]
        let data: Data = try .init(contentsOf: car.url, options: [.uncachedRead, .alwaysMapped])
        let token = String(cString: chars).data(using: .utf8)!
        
        return data.range(of: token, options: .anchored, in: data.startIndex..<data.endIndex) != nil
    }
    
    private func readTheme(_ catalog: CUICatalog) -> [T] {
        return catalog.allAssetKeys.compactMap { key in
            guard let rendition = catalog._themeStore()?.rendition(withKey: key.keyList()) else {
                return nil
            }
            return T(rendition)
        }
    }
}
