//
//  SearchViewController.swift
//  Presentation
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import UIKit
import TwitterKit
import TwitterCore

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func request() {
        if TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers() {
            
        } else {
            TWTRTwitter.sharedInstance().logIn(with: self) { (session, error) in
                
            }
        }
    }
    
    @IBAction func tryAgain() {
        request()
    }
}
