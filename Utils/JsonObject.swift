//
//  JsonProvider.swift
//  Utils
//
//  Created by Willian on 05/05/2018.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation

public typealias JsonObject = [String : Any?]
public typealias JsonArray = [JsonObject]

public protocol JsonConvertible {
    init(with json: JsonObject?) throws
}

public enum JsonResult: Equatable {
    case object(JsonObject)
    case array(JsonArray)
    
    public init(any: Any) throws {
        
        switch any {
        case let object as JsonObject:
            self = .object(object)
        case let array as JsonArray:
            self = .array(array)
        default:
            throw JsonError.couldNotCastToJsonResult
        }
    }
    
    public var object: JsonObject? {
        if case let .object(json) = self {
            return json
        }
        return nil
    }
    
    public var array: JsonArray? {
        if case let .array(json) = self {
            return json
        }
        return nil
    }
    
    public static func ==(lhs: JsonResult, rhs: JsonResult) -> Bool {
        switch (lhs, rhs) {
        case (.object, .object), (.array, .array):
            return true
        default:
            return false
        }
    }
}

public extension JsonResult {
    public func map<T: JsonConvertible>() throws -> T {
        guard let json = self.object else {
            throw JsonError.malformed
        }
        return try T(with: json)
    }
    
    public func mapList<T: JsonConvertible>() throws -> [T] {
        guard let list = self.array else {
            throw JsonError.malformed
        }

        return try list.compactMap { try T(with: $0) }
    }
}
