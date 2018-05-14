//
//  TweetsConfigurator.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Domain
import Swinject
import SwinjectStoryboard

public extension TweetsViewController {
    public static func register(container: Container) {
        container.register(TweetsBusinessLogic.self) { (r, view: TweetsDisplayLogic) in
            let presenter = r.resolve(TweetsPresentationLogic.self, argument: view)!
            let useCase = r.resolve(GetUserTimelineUseCase.self)!
            let interactor = TweetsInteractor(presenter: presenter, getUserTimelineUseCase: useCase)
            return interactor
        }
        
        container.register(TweetsPresentationLogic.self) { (r, view: TweetsDisplayLogic) in
            return TweetsPresenter(view: view)
        }

        container.storyboardInitCompleted(TweetsViewController.self) { (r, c) in
            c.interactor = r.resolve(TweetsBusinessLogic.self, argument: c as TweetsDisplayLogic)!
        }
    }
}


