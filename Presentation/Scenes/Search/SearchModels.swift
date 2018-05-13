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

public struct Search {
    public struct GetFriends {
        public struct Request { }
        
        public struct Response {
            public let result: Result<[User]>
        }
        
        public struct ViewModel {
            public let content: Content<[UserTableViewCell.ViewModel]>
        }
    }
}
