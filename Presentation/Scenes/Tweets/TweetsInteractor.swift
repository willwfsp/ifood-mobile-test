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
    let getUserTimelineUseCase: GetUserTimelineUseCase
    
    var selectedUser: User?
    
    init(presenter: TweetsPresentationLogic, getUserTimelineUseCase: GetUserTimelineUseCase) {
        self.presenter = presenter
        self.getUserTimelineUseCase = getUserTimelineUseCase
    }
}

extension TweetsInteractor: TweetsBusinessLogic {
    func getTweets(request: Tweets.GetTweets.Request) {
        guard let userId = selectedUser?.id else { return }
        let request = GetUserTimelineUseCase.Request(userId: userId)
        
        getUserTimelineUseCase.execute(request: request) { [weak self] in
            let response = Tweets.GetTweets.Response(result: $0)
            self?.presenter.presentTweets(response: response)
        }
    }
    
    func getUserScreenName(request: Tweets.GetUserScreenName.Request) {
        guard let selectedUser = selectedUser else { return }
        let response = Tweets.GetUserScreenName.Response(selectedUser: selectedUser)
        presenter.presentUserScreenName(response: response)
    }
}
