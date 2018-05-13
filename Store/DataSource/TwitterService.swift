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
    case timeline(userId: String)
    case friends(userId: String)
}

extension TwitterService: TargetType {
    var baseUrl: String {
        return "https://api.twitter.com"
    }
    
    var path: String {
        switch self {
        case .searchUsers:
            return "/1.1/users/search.json"
        case .timeline:
            return "/1.1/statuses/user_timeline.json"
        case .friends:
            return "/1.1/friends/list.json"
        }
        
    }
    
    var method: ApiMethod {
        return .get
    }
    
    var paramethers: [String : Any] {
        switch self {
        case let .searchUsers(term):
            return ["q" : term]
        case let .timeline(userId):
            return ["user_id" : userId]
        case let .friends(userId):
            return ["user_id" : userId]
        }
    }
}
