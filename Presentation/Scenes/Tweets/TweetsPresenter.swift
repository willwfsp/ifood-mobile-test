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
    func presentUserScreenName(response: Tweets.GetUserScreenName.Response)
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
    
    func presentUserScreenName(response: Tweets.GetUserScreenName.Response) {
        var screenName = response.selectedUser.screenName ?? ""
        if !screenName.isEmpty {
            screenName = "@\(screenName)"
        } else {
            screenName = "Tweets"
        }
        
        let viewModel = Tweets.GetUserScreenName.ViewModel(screenName: screenName)
        view.displayTitle(viewModel: viewModel)
    }
}
