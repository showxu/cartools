//
//  SharedPreference.swift
//  Cartools
//
//  Created by show on 1/13/21.
//

import Foundation

final class SharedPreferences {
    
    enum Key: String {
        case ignorePackedAssets
    }
    
    static let shared = SharedPreferences()
    
    let userDefaults: UserDefaults
    
    init(_ userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    subscript(key: Key) -> Bool {
        get {
            return userDefaults.bool(forKey: key.rawValue)
        } set {
            userDefaults.set(newValue, forKey: key.rawValue)
        }
    }
}
