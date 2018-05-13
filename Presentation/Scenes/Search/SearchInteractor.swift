//
//  SearchInteractor.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Domain

protocol SearchBusinessLogic {
    func getLoggedUserFriends(request: Search.GetFriends.Request)
}

struct SearchInteractor {
    let presenter: SearchPresentationLogic
    let getLoggedUserFriendsUseCase: GetLoggedUserFriendsUseCase
}

extension SearchInteractor: SearchBusinessLogic {
    func getLoggedUserFriends(request: Search.GetFriends.Request) {
        getLoggedUserFriendsUseCase.execute() {
            let response = Search.GetFriends.Response(result: $0)
            self.presenter.presentFriends(response: response)
        }
    }
}
