//
//  Friends.swift
//  Store
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils
import Domain

struct Friends {
    let users: [User]
}

extension Friends: JsonConvertible {
    init(with json: JsonObject?) throws {
        users = try (json?["users"] as? JsonArray)?.compactMap {
            try User(with: $0)
        } ?? []
    }
}

