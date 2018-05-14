//
//  TweetsInteractor.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Domain

protocol TweetsBusinessLogic {
    func getTweets(request: Tweets.GetTweets.Request)
    func getUserScreenName(request: Tweets.GetUserScreenName.Request)
    
    var selectedUser: User? { get set }
}

class TweetsInteractor {
    let presenter: TweetsPresentationLogic
    let getLoggedUserFriendsUseCase: GetLoggedUserFriendsUseCase
    
    var selectedUser: User?
    
    init(presenter: TweetsPresentationLogic, getLoggedUserFriendsUseCase: GetLoggedUserFriendsUseCase) {
        self.presenter = presenter
        self.getLoggedUserFriendsUseCase = getLoggedUserFriendsUseCase
    }
}

extension TweetsInteractor: TweetsBusinessLogic {
    func getTweets(request: Tweets.GetTweets.Request) {

    }
    
    func getUserScreenName(request: Tweets.GetUserScreenName.Request) {
        guard let selectedUser = selectedUser else { return }
        let response = Tweets.GetUserScreenName.Response(selectedUser: selectedUser)
        presenter.presentUserScreenName(response: response)
    }
}
