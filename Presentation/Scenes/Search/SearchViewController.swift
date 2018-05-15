//
//  SearchViewController.swift
//  Presentation
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import UIKit
import Reusable
import Domain
import Store

public protocol SearchDisplayLogic {
    func displayFriends(viewModel: Search.GetUsers.ViewModel)
}

public class SearchViewController: UIViewController, ShowError {
    var interactor: SearchBusinessLogic! = nil
    var router: SearchRouter! = nil
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet private weak var searchTermLabel: UILabel!
    
    let searchController = UISearchController(searchResultsController: nil)
    var selectedIndex: Int? = nil
    
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
            case let .error(error):
                display(error: error)
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
        setupSearchController()
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
    
    func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search Users"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }

    func getFriends() {
        content = .loading
        let request = Search.GetUsers.Request.Friends()
        interactor.getLoggedUserFriends(request: request)
    }
    
    @IBAction func tryAgain() {
        getFriends()
    }
}

extension SearchViewController: SearchDisplayLogic {
    public func displayFriends(viewModel: Search.GetUsers.ViewModel) {
        content = viewModel.content
        searchTermLabel.text = viewModel.term
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
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        router.navigateToUserTweets()
    }
}

extension SearchViewController: UISearchResultsUpdating {

    func filterContentForSearchText(_ searchText: String) {
        guard !searchText.isEmpty else {
            getFriends()
            return
        }
        let request = Search.GetUsers.Request.Search(term: searchText)
        interactor.searchUsers(request: request)
    }
    
    // MARK: - UISearchResultsUpdating Delegate
    public func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
}
