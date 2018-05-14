//
//  TweetsModels.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils
import Domain

public struct Tweets {
    public struct GetTweets {
        public struct Request { }
        
        public struct Response {
            public let result: Result<[Tweet]>
        }
        
        public struct ViewModel {
            public let content: Content<[TweetTableViewCell.ViewModel]>
        }
    }
}
