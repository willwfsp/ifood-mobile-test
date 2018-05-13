//
//  Tweet+JsonObject.swift
//  Store
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Domain
import Utils

extension Tweet: JsonConvertible {
    public init(with json: JsonObject?) throws {
        guard let id = json?["id_str"] as? String
            else { throw JsonError.missingField("id_str")}
        
        let text = json?["text"] as? String
        let createdDate = json?["created_at"] as? String
        
        self.init(id: id, text: text, createdDate: createdDate)
    }
}
