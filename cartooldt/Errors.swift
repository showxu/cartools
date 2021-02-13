//
//  Errors.swift
//  CartoolKit
//
//  Created by Xudong Xu on 1/8/21.
//

import Foundation

private class ErrorHelper {
}

public enum CarError {
    
    case notFound(_ target: String)
    
    public static let domain = Bundle(for: ErrorHelper.self).bundleIdentifier!
    
    func asNSError() -> NSError {
        var description: String = ""
        
        switch self {
        case let .notFound(target):
            description = "File not found: \(target)"
        }
    
        return .init(domain: type(of: self).domain,
                     code: -1,
                     userInfo: [
                        NSLocalizedDescriptionKey: description
                     ])
    }
}
