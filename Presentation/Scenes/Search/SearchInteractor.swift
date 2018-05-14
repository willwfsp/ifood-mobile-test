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
    func getLoggedUserFriends(request: Search.GetUsers.Request.Friends)
    func searchUsers(request: Search.GetUsers.Request.Search)
    var users: [User]? { get set }
}

class SearchInteractor {
    let presenter: SearchPresentationLogic
    let getLoggedUserFriendsUseCase: GetLoggedUserFriendsUseCase
    let searchUsersUseCase: SearchUsersUseCase
    
    var users: [User]?
    
    init(presenter: SearchPresentationLogic, getLoggedUserFriendsUseCase: GetLoggedUserFriendsUseCase, searchUsersUseCase: SearchUsersUseCase) {
        self.presenter = presenter
        self.getLoggedUserFriendsUseCase = getLoggedUserFriendsUseCase
        self.searchUsersUseCase = searchUsersUseCase
    }
}

extension SearchInteractor: SearchBusinessLogic {
    func getLoggedUserFriends(request: Search.GetUsers.Request.Friends) {
        getLoggedUserFriendsUseCase.execute() { [weak self] in
            if case let .success(users) = $0 {
                self?.users = users
            }
            let response = Search.GetUsers.Response(result: $0, term: nil)
            self?.presenter.presentUsers(response: response)
        }
    }
    
    func searchUsers(request: Search.GetUsers.Request.Search) {
        let usecaseRequest = SearchUsersUseCase.Request(term: request.term)
        searchUsersUseCase.execute(request: usecaseRequest) { [weak self] in
            if case let .success(users) = $0 {
                self?.users = users
            }
            let response = Search.GetUsers.Response(result: $0, term: request.term)
            self?.presenter.presentUsers(response: response)
        }
    }
}
