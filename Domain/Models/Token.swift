//
//  Token.swift
//  Domain
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation

public struct Token {
    public let type: String?
    public let accessToken: String
    
    public init(type: String?, accessToken: String) {
        self.type = type
        self.accessToken = accessToken
    }
}
