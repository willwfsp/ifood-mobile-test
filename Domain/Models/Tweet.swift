//
//  Tweet.swift
//  Domain
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation

public struct Tweet {
    public let id: String
    public let text: String?
    public let createdDate: String?
    
    public init(id: String, text: String?, createdDate: String?) {
        self.id = id
        self.text = text
        self.createdDate = createdDate
    }
    
}
