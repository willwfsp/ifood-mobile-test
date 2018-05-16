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
    let _title: String
    let _localizedDescription: String
    
    public init(title: String, localizedDescription: String) {
        _title = title
        _localizedDescription = localizedDescription
    }
    
    public var title: String {
        return _title
    }

    public var localizedDescription: String {
        return _localizedDescription
    }
}


extension Error {
    public var nsError: NSError {
        return self as NSError
    }
    public var httpError: HTTPError {
        return nsError.httpError()
    }
    public var genericError: DescribableError {
        return GenericError(title: "Error", localizedDescription: "An error occurred, try again later.")
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

extension Describable {
    func nsError() -> NSError {
        return NSError(domain: title, code: 99999, userInfo: [NSLocalizedDescriptionKey: localizedDescription])
    }
}


extension NSError {
    public func describableError() -> DescribableError{
        return GenericError(title: domain , localizedDescription: localizedDescription)
    }
    
    public func httpError() -> HTTPError {
        return HTTPError(nsError: self)
    }
}

public enum HTTPError: DescribableError {
    case noInternetConnection
    case unauthorized
    case forbidden
    case notFound
    case badRequest
    case other(code: Int, message: String)
    
    public init(nsError: NSError) {
        switch nsError.code {
        case -1009: self = .noInternetConnection
        case 400: self = .badRequest
        case 401: self = .unauthorized
        case 403: self = .forbidden
        case 404: self = .notFound
        default: self = .other(code: nsError.code, message: nsError.localizedDescription)
        }
    }
    
    public var title: String {
        return "Error"
    }
    
    public var localizedDescription: String {
        switch self {
        case .noInternetConnection:
            return "There is no internet connection. Please, check yout connection and try again later."
        case .badRequest:
            return "The request failed. Try again later."
        case .unauthorized:
            return "You are unautorized to access some services."
        case .forbidden:
            return "Forbidden Access."
        case .notFound:
            return "Resource not found"
        case .other:
            return "An error occurred, try again later."
        }
    }
    
}
