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

public struct AuthRepository: Domain.AuthRepository {
    let restDataSource: RestDataSource<TwitterService>
    let keyChainDataSource: KeychainDataSource
    
    public init(restDataSource: RestDataSource<TwitterService>, keyChainDataSource: KeychainDataSource) {
        self.restDataSource = restDataSource
        self.keyChainDataSource = keyChainDataSource
    }
    
    public func authenticate(completion: @escaping (Result<Token>) -> ()) {
        restDataSource.request(.token, token: "R0l1RWRlNGR2MUo4RDdJVkwzRGNJbzMzTjpQM3dJSjN5Y2pQSW5CUzRsbG94OGJrZW40M1lVY2NmRHV1STVwSFFCZmJnMWh5T0tJNw==") {
            switch $0 {
            case let .success(jsonResult):
                
                do {
                    guard let json = jsonResult.object
                        else { throw JsonError.malformed }
                    
                    let token = try Token(with: json)
                    completion(.success(data: token))
                } catch {
                    completion(.failure(error: error))
                }

            case let .failure(error):
                completion(.failure(error: error))
            }
        }
    }
}
