//
//  UserRepository.swift
//  Domain
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

public protocol UserRepository {
    func searchUsers(term: String, completion: @escaping (Result<[User]>) -> ())
}
