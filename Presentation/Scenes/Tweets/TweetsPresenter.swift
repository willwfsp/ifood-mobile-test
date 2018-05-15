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
    
    func makeSentiment(score: Double?) -> (emoji: String, color: UIColor) {
        guard let score = score else {
            return ("", .clear)
        }
        
        switch score {
        case ..<(-0.1): return ("😔", .sadRed)
        case -0.1..<0.1: return ("😐", .neutralGrey)
        default: return ("😃", .happyGreen)
        }
    }
}

extension TweetsPresenter: TweetsPresentationLogic {
    func presentTweets(response: Tweets.GetTweets.Response) {
        switch response.result {
        case let .success(tweets):
            typealias ViewModel = TweetTableViewCell.ViewModel
            
            let data: [ViewModel] = tweets.map {
                let sentiment = makeSentiment(score: $0.sentence?.score)
                
                return ViewModel(text: $0.sentence?.text ?? "",
                                 date: $0.createdDate ?? "",
                                 emoji: sentiment.emoji,
                                 happinesColor: sentiment.color)
            }
            
            let viewModel = Tweets.GetTweets.ViewModel(content: .data(data))
            view.displayTweets(viewModel: viewModel)
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
