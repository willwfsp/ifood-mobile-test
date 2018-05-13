//
//  TwitterService.swift
//  Store
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation


enum ApiMethod: String {
    case get = "GET"
}

protocol TargetType {
    var baseUrl: String { get }
    var path: String { get }
    var method: ApiMethod { get }
    var paramethers: [String : Any] { get }
}

extension TargetType {
    var endpoint: String {
        return "\(baseUrl)\(path)"
    }
}

enum TwitterService {
    case searchUsers(term: String)
}

extension TwitterService: TargetType {
    var baseUrl: String {
        return "https://api.twitter.com"
    }
    
    var path: String {
        return "/1.1/users/search.json"
    }
    
    var method: ApiMethod {
        return .get
    }
    
    var paramethers: [String : Any] {
        switch self {
        case let .searchUsers(term):
            return ["q" : term]
        }
    }
}
