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
    
    let dataSource: TwitterDataSource
    
    public init(dataSource: TwitterDataSource) {
        self.dataSource = dataSource
    }
    
    public func searchUsers(term: String, completion: @escaping (Result<[User]>) -> ()) {
        dataSource.request(.searchUsers(term: term)) {
            switch $0 {
            case let .success(jsonResult):
                do {
                    guard let list = jsonResult.array
                        else { throw JsonError.malformed }
                    
                    let users = try self.compactMap(list: list)
                    completion(.success(data: users))
                } catch {
                    completion(.failure(error: error))
                }
               
            case let .failure(error):
                completion(.failure(error: error))
            }
        }
    }
    
    func compactMap(list: JsonArray) throws -> [User] {
        return try list.compactMap { try User(with: $0) }
    }
}

