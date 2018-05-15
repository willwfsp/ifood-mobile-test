//
//  SessionRepository.swift
//  Store
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils
import Domain

public struct SessionRepository: Domain.SessionRepository {
    
    let dataSource: TwitterDataSource
    
    public init(dataSource: TwitterDataSource) {
        self.dataSource = dataSource
    }
    
    public func getSessionUserId(completion: @escaping (Result<String>) -> ()) {
        dataSource.getApiClient {
            switch $0 {
            case let .success(client):
                guard let userId = client.userID else {
                    completion(.failure(JsonError.missingField("userID")))
                    return
                }
                completion(.success(userId))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
