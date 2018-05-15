//
//  Errors.swift
//  Utils
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation

public protocol Describable {
    var title: String { get }
    var localizedDescription: String { get }
}

public struct GenericError: DescribableError {
    public var title: String {
        return "Error"
    }
    
    public var localizedDescription: String {
        return "An error occurred, try again later."
    }
}


extension Error {
    public var genericError: DescribableError {
        return GenericError()
    }
}

public typealias DescribableError = Describable & Error

public enum JsonError: DescribableError, Equatable {
    case isNotJsonObject
    case malformed
    case missingField(String)
    case couldNotCastToJsonResult
    
    public static func ==(lhs: JsonError, rhs: JsonError) -> Bool {
        switch (lhs, rhs) {
        case (.isNotJsonObject, .isNotJsonObject),
             (.malformed, .malformed),
             (.couldNotCastToJsonResult, .couldNotCastToJsonResult): return true
        case let (.missingField(l), .missingField(r)): return l == r
        default: return false
        }
    }
    
    public var title: String {
        return "JSON Error"
    }
    
    public var localizedDescription: String {
        switch self {
        case .isNotJsonObject:
            return "Trying to parse an object. It's an array!"
        case .malformed:
            return "Malformed JSON. Could't parse objects."
        case let .missingField(field):
            return "There is an missing field: \(field)"
        case .couldNotCastToJsonResult:
            return "Cound not cast to JSONResult"
        }
    }
    
}
