//
//  SearchViewController.swift
//  Presentation
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import UIKit
import Store

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        request()
    }
    
    func request() {
        let dataSource = RestDataSource<TwitterService>()
        let repository = AuthRepository(restDataSource: dataSource, keyChainDataSource: KeychainDataSource.shared)
        
        repository.authenticate { (success) in
            
        }
    }
    
    @IBAction func tryAgain() {
        request()
    }
}
