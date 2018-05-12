//
//  UserRepository.swift
//  Store
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils
import Moya
import Domain

public struct UserRepository: Domain.UserRepository {
    let dataSource: RestDataSource<TwitterService>
    let token: String
    public init(dataSource: RestDataSource<TwitterService>, token: String) {
        self.dataSource = dataSource
        self.token = token
    }
    
    public func searchUsers(term: String, completion: @escaping (Result<[User]>) -> ()) {
        dataSource.request(.searchUsers(term: term), token: token) {
            switch $0 {
            case let .success(jsonResult):
                break
            case let .failure(error):
                completion(.failure(error: error))
            }
        }
    }
}

