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
        splitViewController?.delegate = self
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
        
        useCase.execute {
            if case let .success(data) = $0 {
                self.data = data
            }
        }
    }
    
    @IBAction func tryAgain() {
        request()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        collapseDetailViewController = false
    }
}

extension SearchViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return collapseDetailViewController
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        let user = data[indexPath.row]
        cell.nameLabel.text = user.name
        cell.screenNameLabel.text = "@\(user.screenName ?? "")"
        cell.descriptionLabel.text = user.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}
