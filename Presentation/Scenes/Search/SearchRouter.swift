//
//  SearchRouter.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//


import UIKit
import Domain
import Utils
import Swinject

class SearchRouter {
    let viewController: SearchViewController
    let container: Container
  
    init(viewController: SearchViewController, container: Container) {
        self.viewController = viewController
        self.container = container
    }

    // MARK: Navigation
    
    func navigateToUserTweets() {

        guard let selectedIndex = viewController.selectedIndex,
            let count = viewController.interactor.users?.count,
            count > selectedIndex else {
                return
        }
        
        let tweetsViewController = DependencyInjection(container: container).resolve(Constants.string.scene.tweets) as! TweetsViewController

        let selectedUser = viewController.interactor.users?[selectedIndex]
        tweetsViewController.interactor.selectedUser = selectedUser
        viewController.navigationController?.pushViewController(tweetsViewController, animated: true)
    }
}

