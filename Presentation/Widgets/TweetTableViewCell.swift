//
//  TweetTableViewCell.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import UIKit
import Reusable

public class TweetTableViewCell: UITableViewCell, Reusable {
    @IBOutlet private weak var tweetLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var emojiLabel: UILabel!
    @IBOutlet private weak var happinessView: UIView!
    
    var viewModel: ViewModel! {
        didSet {
            tweetLabel.text = viewModel.text
            dateLabel.text = viewModel.date
            emojiLabel.text = viewModel.emoji
            happinessView.backgroundColor = viewModel.happinesColor
        }
    }
}

extension TweetTableViewCell {
    public struct ViewModel {
        let text: String
        let date: String
        let emoji: String
        let happinesColor: UIColor
    }
}
