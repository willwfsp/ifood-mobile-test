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
    var users: [User]? { get set }
}

class SearchInteractor {
    let presenter: SearchPresentationLogic
    let getLoggedUserFriendsUseCase: GetLoggedUserFriendsUseCase
    
    var users: [User]?
    
    init(presenter: SearchPresentationLogic, getLoggedUserFriendsUseCase: GetLoggedUserFriendsUseCase) {
        self.presenter = presenter
        self.getLoggedUserFriendsUseCase = getLoggedUserFriendsUseCase
    }
}

extension SearchInteractor: SearchBusinessLogic {
    func getLoggedUserFriends(request: Search.GetFriends.Request) {
        getLoggedUserFriendsUseCase.execute() {
            if case let .success(users) = $0 {
                self.users = users
            }
            let response = Search.GetFriends.Response(result: $0)
            self.presenter.presentFriends(response: response)
        }
    }
}
