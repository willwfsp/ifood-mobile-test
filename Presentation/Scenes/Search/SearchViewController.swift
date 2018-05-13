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

public protocol SearchDisplayLogic {
    func displayFriends(viewModel: Search.GetFriends.ViewModel)
}

public class SearchViewController: UIViewController {
    var interactor: SearchBusinessLogic! = nil
    
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    var collapseDetailViewController = true
    var list: [UserTableViewCell.ViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var content: Content<[UserTableViewCell.ViewModel]> = .loading {
        didSet {
            setActivityIndicator(visible: false)
            
            switch content {
            case let .data(list):
                self.list = list
            case .error: break
            case .loading:
                setActivityIndicator(visible: true)
            case .empty:
                list = []
            }
        }
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getFriends()
    }
    
    func setActivityIndicator(visible: Bool) {
        if visible {
            activityIndicatorView.startAnimating()
        } else {
            activityIndicatorView.stopAnimating()
        }
        tableView.isHidden = visible
    }
    
    func setupTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 84
    }
    
    func getFriends() {
        content = .loading
        let request = Search.GetFriends.Request()
        interactor.getLoggedUserFriends(request: request)
    }
    
    @IBAction func tryAgain() {
        getFriends()
    }
}

extension SearchViewController: SearchDisplayLogic {
    public func displayFriends(viewModel: Search.GetFriends.ViewModel) {
        content = viewModel.content
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.viewModel = list[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
}
