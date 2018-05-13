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

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func request() {
        let dataSource = TwitterDataSource(twitter: TWTRTwitter.sharedInstance())
        let userRepository = UserRepository(dataSource: dataSource)
        
        userRepository.timeline(userId: "292383655") { (result) in

        }
    }
    
    @IBAction func tryAgain() {
        request()
    }
}
