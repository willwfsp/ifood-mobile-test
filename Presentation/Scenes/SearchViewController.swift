//
//  SearchViewController.swift
//  Presentation
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import UIKit
import TwitterKit
import Store
import Domain

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func request() {
        let dataSource = TwitterDataSource(twitter: TWTRTwitter.sharedInstance())
        let userRepository = UserRepository(dataSource: dataSource)
        let sessionRepository = SessionRepository(dataSource: dataSource)
        let useCase = GetLoggedUserFriendsUseCase(userRepository: userRepository, sessionRepository: sessionRepository)
        
        useCase.execute { (result) in
            
        }
    }
    
    @IBAction func tryAgain() {
        request()
    }
}
