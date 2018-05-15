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
    public let sentence: Sentence?
    public let createdDate: String?
    
    public init(id: String, sentence: Sentence?, createdDate: String?) {
        self.id = id
        self.sentence = sentence
        self.createdDate = createdDate
    }
    
}
