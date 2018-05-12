//
//  UserRepository.swift
//  Store
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Domain

public struct AuthRepository: Domain.AuthRepository {
    let restDataSource: RestDataSource<TwitterService>
    let keyChainDataSource: KeychainDataSource
    
    public init(restDataSource: RestDataSource<TwitterService>, keyChainDataSource: KeychainDataSource) {
        self.restDataSource = restDataSource
        self.keyChainDataSource = keyChainDataSource
    }
    
    public func authenticate(completion: @escaping (Bool) -> ()) {
        restDataSource.request(.token) {
            switch $0 {
            case let .success(jsonResult):
                guard let json = jsonResult.object else {
                    completion(false)
                    return
                }
                
                guard let token = try? Token(with: json) else {
                    completion(false)
                    return
                }
                typealias Key = KeychainDataSource.Key
                
                // Provisório
                KeychainDataSource.shared.save(value: token.accessToken, forKey: Key.accessToken)
                completion(true)
            case .failure:
                completion(false)
            }
        }
    }
}
