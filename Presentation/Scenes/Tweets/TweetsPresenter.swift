//
//  TweetsPresenter.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation

protocol TweetsPresentationLogic {
    func presentTweets(response: Tweets.GetTweets.Response)
}

struct TweetsPresenter {
    let view: TweetsDisplayLogic
}

extension TweetsPresenter: TweetsPresentationLogic {
    func presentTweets(response: Tweets.GetTweets.Response) {
        switch response.result {
        case let .success(tweets):
            typealias ViewModel = TweetTableViewCell.ViewModel

        default:
            break
        }
    }
}
