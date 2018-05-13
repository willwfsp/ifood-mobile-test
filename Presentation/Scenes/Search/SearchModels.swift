//
//  SearchModels.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils
import Domain

struct Search {
    struct GetFriends {
        struct Request { }
        
        struct Response {
            let result: Result<[User]>
        }
        
        struct ViewModel {
            let content: Content<[UserTableViewCell.ViewModel]>
        }
    }
}
