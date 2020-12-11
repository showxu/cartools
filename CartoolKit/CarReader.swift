//
//  CarReader.swift
//  CartoolKit
//
//  Created by show on 1/7/21.
//

import CoreThemeDefinition
import CoreUI
import Cocoa

extension Car {
    
    public class Reader<T> where T: Rendition {
    
        public typealias CompletionHandler = (Result<[T], Error>) -> Void
        
        fileprivate let car: Car
        
        public init(_ car: Car) {
            self.car = car
        }
        
        @discardableResult
        public func read(_ completion: CompletionHandler?) -> Self {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                guard let self = self else { return }
                do {
                    let catalog = try CUICatalog(url: self.car.url)
                    guard try
                        !self._isPro(self.car),
                        let count = catalog.allImageNames()?.count,
                        count != 0,
                        catalog.responds(to: #selector(CUICatalog.image(withName:scaleFactor:)))
                    else {
                        return
                    }
                    completion?(.success(self._readTheme(catalog)))
                } catch {
                    completion?(.failure(error))
                }
            }
            return self
        }
        
        private func _isPro(_ car: Car) throws -> Bool {
            let chars: [CChar] = [0x50, 0x72, 0x6F, 0x54, 0x68, 0x65, 0x6D, 0x65, 0x44, 0x65, 0x66, 0x69, 0x6E, 0x69, 0x74, 0x69, 0x6F, 0x6E]
            let data: Data = try .init(contentsOf: car.url, options: [.uncachedRead, .alwaysMapped])
            let token = String(cString: chars).data(using: .utf8)!
            
            return data.range(of: token, options: .anchored, in: data.startIndex..<data.endIndex) != nil
        }
        
        private func _readTheme(_ catalog: CUICatalog) -> [T] {
            return catalog.allAssetKeys.compactMap { key in
                guard let rendition = catalog._themeStore()?.rendition(withKey: key.keyList()) else {
                    return nil
                }
                return T(rendition)
            }
        }
    }
}
