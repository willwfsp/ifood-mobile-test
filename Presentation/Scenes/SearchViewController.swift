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
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    var collapseDetailViewController = true
    
    var data: [User] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        request()
    }
    
    func setupTable() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 84
    }
    
    func request() {
        let dataSource = TwitterDataSource(twitter: TWTRTwitter.sharedInstance())
        let userRepository = UserRepository(dataSource: dataSource)
        let sessionRepository = SessionRepository(dataSource: dataSource)
        let useCase = GetLoggedUserFriendsUseCase(userRepository: userRepository, sessionRepository: sessionRepository)
        activityIndicatorView.startAnimating()
        tableView.isHidden = true
        useCase.execute {
            if case let .success(data) = $0 {
                self.data = data
            }
            self.activityIndicatorView.stopAnimating()
            self.tableView.isHidden = false
        }
    }
    
    @IBAction func tryAgain() {
        request()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let user = data[indexPath.row]
        
        let url = URL(string: user.profileImageUrl!)
        let viewModel = UserTableViewCell.ViewModel(profileImageUrl: url!, name: user.name ?? "", screenName: "@\(user.screenName ?? "")", description: user.description ?? "")
        
        cell.viewModel = viewModel
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}
