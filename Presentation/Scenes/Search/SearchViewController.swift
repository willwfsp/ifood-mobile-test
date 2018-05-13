//
//  SearchViewController.swift
//  Presentation
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import UIKit
import TwitterKit
import Reusable
import Store
import Domain

protocol SearchDisplayLogic {
    func displayFriends(viewModel: Search.GetFriends.ViewModel)
}

class SearchViewController: UIViewController {
    var interactor: SearchBusinessLogic! = nil
    
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    var collapseDetailViewController = true
    
    var content: [UserTableViewCell.ViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getFriends()
    }
    
    func setupTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 84
    }
    
    func getFriends() {
        let request = Search.GetFriends.Request()
        interactor.getLoggedUserFriends(request: request)
    }
    
    @IBAction func tryAgain() {
        getFriends()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
