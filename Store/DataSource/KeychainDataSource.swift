//
//  KeychainDataSource.swift
//  Store
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation

public struct KeychainDataSource {
    
    public static var shared = KeychainDataSource()
    
    public enum Key: String {
        case accessToken = "access_token"
    }
    
    var store = [String: Any]()
    
    mutating func save(value: Any, forKey key: Key) {
        store[key.rawValue] = value
    }
    
    func get(key: Key) -> Any? {
        return store[key.rawValue]
    }
}
