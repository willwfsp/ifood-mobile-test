//
//  SentimentService.swift
//  Store
//
//  Created by Willian on 14/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Moya

public enum NaturalLanguageService {
    case sentiment(text: String)
}

extension NaturalLanguageService: TargetType {
    var accessToken: String {
        return "ya29.c.El-8BYK_dHPyoahiuwWb2OiktiH5RVZWhn8P18qWueuuiTCZY0VXXVa13QggOTpLz_3UxeJTOHOgUIJpjL_9JEKNWvIlawtmU4iLBZ-b_jS80bZyiZd597XbXdYcIkm3qA"
    }
    public var baseURL: URL {
        return URL(string: "https://language.googleapis.com/v1/")!
    }
    
    public var path: String {
        return "documents:analyzeSentiment"
    }
    
    public var method: Moya.Method {
        return .post
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        
        switch self {
        case let .sentiment(text):
            let parameters = ["encodingType": "UTF8",
                              "document": [
                                "type": "PLAIN_TEXT",
                                "content": text]] as [String : Any]
            return .requestParameters(parameters: parameters, encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return [
            "Authorization" : "Bearer \(accessToken)",
            "Content-Type": "application/json; charset=utf-8"
        ]
    }
    
    
}
