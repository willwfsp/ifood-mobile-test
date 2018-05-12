//
//  SearchViewController.swift
//  Presentation
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import UIKit
import Domain
import Utils
import Store

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        request()
    }
    
    func request() {
        let dataSource = RestDataSource<TwitterService>()
        let repository = AuthRepository(restDataSource: dataSource, keyChainDataSource: KeychainDataSource.shared)
        
        
        
        repository.authenticate {
            guard let accessToken = $0.data?.accessToken
                else { return }
            
            let userRepository = UserRepository(dataSource: dataSource, token: accessToken)
            userRepository.searchUsers(term: "WPoliciano") { (result) in
                
            }
        }
    }
    
    @IBAction func tryAgain() {
        request()
    }
}
