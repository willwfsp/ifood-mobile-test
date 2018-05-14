//
//  SearchConfigurator.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Domain
import Swinject
import SwinjectStoryboard

public extension SearchViewController {
    public static func register(container: Container) {
        container.register(SearchBusinessLogic.self) { (r, view: SearchDisplayLogic) in
            let presenter = r.resolve(SearchPresentationLogic.self, argument: view)!
            let useCase = r.resolve(GetLoggedUserFriendsUseCase.self)!
            let interactor = SearchInteractor(presenter: presenter, getLoggedUserFriendsUseCase: useCase)
            return interactor
        }
        
        container.register(SearchPresentationLogic.self) { (r, view: SearchDisplayLogic) in
            return SearchPresenter(view: view)
        }
        
        container.register(SearchRouter.self) { (r, viewController: SearchViewController) in
            return SearchRouter(viewController: viewController, container: container)
        }

        container.storyboardInitCompleted(SearchViewController.self) { (r, c) in
            c.interactor = r.resolve(SearchBusinessLogic.self, argument: c as SearchDisplayLogic)!
            c.router = r.resolve(SearchRouter.self, argument: c as SearchViewController)!
        }
    }
}
