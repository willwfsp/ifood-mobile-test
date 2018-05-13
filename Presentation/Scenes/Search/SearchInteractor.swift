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
    let getLoggedUserFriendsUseCase: GetLoggedUserFriendsUseCase
    
    init(getLoggedUserFriendsUseCase: GetLoggedUserFriendsUseCase) {
        self.getLoggedUserFriendsUseCase = getLoggedUserFriendsUseCase
    }
}

extension SearchInteractor: SearchBusinessLogic {
    func getLoggedUserFriends(request: Search.GetFriends.Request) {
        
    }
}
