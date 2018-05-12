//
//  UserRepository.swift
//  Store
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Domain

struct UserRepository: Domain.UserRepository {
    func searchUsers(term: String, completion: (Result<[User]>) -> ()) {
        
    }
}
