//
//  SearchPresenter.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

protocol SearchPresentationLogic {
    func presentUsers(response: Search.GetUsers.Response)
}

struct SearchPresenter {
    let view: SearchDisplayLogic
}

extension SearchPresenter: SearchPresentationLogic {
    func presentUsers(response: Search.GetUsers.Response) {
        switch response.result {
        case let .success(users):
            typealias ViewModel = UserTableViewCell.ViewModel
            
            let data: [ViewModel] = users.map {
                let url = URL(string: $0.profileImageUrl ?? "")!
                var screenName = $0.screenName ?? ""
                if !screenName.isEmpty {
                    screenName = "@\(screenName)"
                }
                
                return ViewModel(profileImageUrl: url,
                                 name: $0.name ?? "",
                                 screenName: screenName,
                                 description: $0.description ?? "")
            }
            
            var term = "FRIENDS"
            
            if let unwrapedTerm = response.term {
                term = "Results for \"\(unwrapedTerm)\"".uppercased()
            }

            let viewModel = Search.GetUsers.ViewModel(content: .data(data), term: term)
            view.displayFriends(viewModel: viewModel)
        case let .failure(error):

            switch error {
            case let httpError as HTTPError:
                switch httpError {
                case .badRequest, .other:
                    return
                default: break
                }
            default: break
            }

            let userError = UserError(title: error.title, localizedDescription: error.localizedDescription, style: .alert)
            
            
            let viewModel = Search.GetUsers.ViewModel(content: .error(userError), term: "")
            view.displayFriends(viewModel: viewModel)
        }
    }
}
