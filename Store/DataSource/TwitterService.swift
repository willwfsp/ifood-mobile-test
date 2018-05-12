//
//  TwitterService.swift
//  Store
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils
import Moya

public enum TwitterService {
    case token
    case searchUsers(term: String)
}

extension TwitterService: TargetType, AccessTokenAuthorizable {
    
    var version: String { return "/1.1/" }
    public var baseURL: URL { return URL(string: "https://api.twitter.com")! }
    
    public var path: String {
        switch self {
        case .token:
            return "/oauth2/token"
        case .searchUsers:
            return "\(version)users/search.json"
        }
    }
    
    public var authorizationType: AuthorizationType {
        switch self {
        case .token: return .basic
        case .searchUsers: return .bearer
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .token:
            return .post
        case .searchUsers:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .token:
            return .requestParameters(parameters: ["grant_type": "client_credentials"], encoding: URLEncoding.default)
        case let .searchUsers(term):
            return .requestParameters(parameters: ["q": term], encoding: URLEncoding.queryString)
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    public var headers: [String : String]? {
        switch self {
        case .token:
            return [
                //"Authorization" : "Basic R0l1RWRlNGR2MUo4RDdJVkwzRGNJbzMzTjpQM3dJSjN5Y2pQSW5CUzRsbG94OGJrZW40M1lVY2NmRHV1STVwSFFCZmJnMWh5T0tJNw==",
                "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8"]
        case .searchUsers:
            return nil//["Authorization" : "Bearer AAAAAAAAAAAAAAAAAAAAAOpI6AAAAAAAFsYQHz7MOwBWS%2F5JPhZUprNtLiM%3DolcI8nGnPyq8D1CXuqjWJJ2hcbhsaC6RdkwE5bhL4KLr4c8Jh6"]
        }
        
    }
}
