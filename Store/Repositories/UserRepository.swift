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
                    let users: [User] = try jsonResult.mapList()
                    completion(.success(users))
                } catch {
                    completion(.failure(error))
                }
               
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    public func timeline(userId: String, completion: @escaping (Result<[Tweet]>) -> ()) {
        dataSource.request(.timeline(userId: userId)) {
            switch $0 {
            case let .success(jsonResult):
                do {
                    let users: [Tweet] = try jsonResult.mapList()
                    completion(.success(users))
                } catch {
                    completion(.failure(error))
                }
                
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    public func friends(userId: String, completion: @escaping (Result<[User]>) -> ()) {
        dataSource.request(.friends(userId: userId)) {
            switch $0 {
            case let .success(jsonResult):
                do {
                    let friends: Friends = try jsonResult.map()
                    completion(.success(friends.users))
                } catch {
                    completion(.failure(error))
                }
                
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func compactMap(list: JsonArray) throws -> [User] {
        return try list.compactMap { try User(with: $0) }
    }
}

