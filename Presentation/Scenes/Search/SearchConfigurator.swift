//
//  SearchConfigurator.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration


extension SearchViewController {
    static func register(container: Container) {
        
        container.autoregister(SearchBusinessLogic.self, initializer: SearchInteractor.init)
        
        container.storyboardInitCompleted(SearchViewController.self) { (r, c) in
            c.interactor = r.resolve(SearchBusinessLogic.self)
        }
    }
}
