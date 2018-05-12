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
    
    public static func ==(lhs: JsonResult, rhs: JsonResult) -> Bool {
        switch (lhs, rhs) {
        case (.object, .object), (.array, .array):
            return true
        default:
            return false
        }
    }
}
