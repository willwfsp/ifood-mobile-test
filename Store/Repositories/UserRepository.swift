//
//  UserRepository.swift
//  Store
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

import Domain

public struct UserRepository: Domain.UserRepository {
    
    public func searchUsers(term: String, completion: @escaping (Result<[User]>) -> ()) {

    }
}

