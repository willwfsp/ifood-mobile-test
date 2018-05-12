//
//  Errors.swift
//  Utils
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation

public enum FileError: Error {
    case notFound
}

public enum JsonError: Error, Equatable {
    case isNotJsonObject
    case malformed
    case missingField(String)
    
    public static func ==(lhs: JsonError, rhs: JsonError) -> Bool {
        switch (lhs, rhs) {
        case (.isNotJsonObject, .isNotJsonObject),
             (.malformed, .malformed): return true
        case let (.missingField(l), .missingField(r)): return l == r
        default: return false
        }
    }
    
}

public enum ResultError: Error {
    case json(JsonError)
    case file(FileError)
}
