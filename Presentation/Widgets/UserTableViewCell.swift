//
//  UserTableViewCell.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import UIKit
import Kingfisher
import Reusable

class UserTableViewCell: UITableViewCell, Reusable {
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var screenNameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    var viewModel: ViewModel! {
        didSet {
            profileImageView.kf.setImage(with: viewModel.profileImageUrl)
            nameLabel.text = viewModel.name
            screenNameLabel.text = viewModel.screenName
            descriptionLabel.text = viewModel.description
        }
    }
}

extension UserTableViewCell {
    struct ViewModel {
        let profileImageUrl: URL
        let name: String
        let screenName: String
        let description: String
    }
}
