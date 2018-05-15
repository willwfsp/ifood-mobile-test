//
//  Sentence.swift
//  Domain
//
//  Created by Willian on 14/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation

public struct Sentence {
    public let text: String?
    public let score: Double?
    
    public init(text: String?, score: Double?) {
        self.text = text
        self.score = score
    }
}
