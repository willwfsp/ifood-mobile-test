//
//  User+JsonObject.swift
//  Store
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils
import Domain

extension User: JsonConvertible {
    public init(with json: JsonObject?) throws {
        guard let id = json?["id_str"] as? String
            else { throw JsonError.missingField("id")}
        
        let name = json?["name"] as? String
        let screenName = json?["screen_name"] as? String
        let profileImageUrl = json?["profile_image_url"] as? String
        let profileBackgroundImageUrl = json?["profile_background_image_url"] as? String
        
        self.init(id: id, name: name, screenName: screenName, profileImageUrl: profileImageUrl, profileBackgroundImageUrl: profileBackgroundImageUrl)
    }
}

