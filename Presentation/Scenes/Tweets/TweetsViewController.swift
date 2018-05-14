//
//  TweetsViewController.swift
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

public protocol TweetsDisplayLogic {
    func displayTweets(viewModel: Tweets.GetTweets.ViewModel)
    func displayTitle(viewModel: Tweets.GetUserScreenName.ViewModel)
}

public class TweetsViewController: UIViewController {
    var interactor: TweetsBusinessLogic! = nil
    
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicatorView: UIActivityIndicatorView!
    
    var collapseDetailViewController = true
    var list: [TweetTableViewCell.ViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    var content: Content<[TweetTableViewCell.ViewModel]> = .loading {
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
        getTweets()
        getTitle()
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
    
    func getTweets() {
        content = .loading
        let request = Tweets.GetTweets.Request()
        interactor.getTweets(request: request)
    }
    
    func getTitle() {
        let request = Tweets.GetUserScreenName.Request()
        interactor.getUserScreenName(request: request)
    }
    
    @IBAction func tryAgain() {
        getTweets()
    }
}

extension TweetsViewController: TweetsDisplayLogic {
    public func displayTweets(viewModel: Tweets.GetTweets.ViewModel) {
        content = viewModel.content
    }
    
    public func displayTitle(viewModel: Tweets.GetUserScreenName.ViewModel) {
        title = viewModel.screenName
    }
}

extension TweetsViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TweetTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        //cell.viewModel = list[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4//list.count
    }
}
