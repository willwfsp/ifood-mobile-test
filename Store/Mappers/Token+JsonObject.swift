//
//  Token+JsonObject.swift
//  Store
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils
import Domain

extension Token {
    init(with json: JsonObject?) throws {
        let type = json?["token_type"] as? String
        guard let accessToken = json?["access_token"] as? String else {
            throw JsonError.missingField("access_token")
        }
        
        self.init(type: type, accessToken: accessToken)
    }
}
