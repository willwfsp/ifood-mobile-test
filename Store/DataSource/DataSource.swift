//
//  File.swift
//  Persistency
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Utils

protocol DataSource {
    func get(id: String, completion: (Result<JsonObject>) -> ())
}
