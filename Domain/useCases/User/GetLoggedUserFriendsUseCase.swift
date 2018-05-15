//
//  GetUserFriendsUseCase.swift
//  Domain
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

public extension GetLoggedUserFriendsUseCase {
    struct Request {
    }
}

public struct GetLoggedUserFriendsUseCase: UseCase {
    public typealias T = [User]
    public typealias R = Request
    
    let userRepository: UserRepository
    let sessionRepository: SessionRepository
    
    public init(userRepository: UserRepository, sessionRepository: SessionRepository) {
        self.userRepository = userRepository
        self.sessionRepository = sessionRepository
    }
    
    public func execute(request: Request? = nil, completion: @escaping (Result<[User]>) -> ()) {
        
        sessionRepository.getSessionUserId {
            switch $0 {
            case let .success(userId):
                self.userRepository.friends(userId: userId) { completion($0) }
            case let .failure(error):
                completion(.failure(error))
            }
        }
        
    }
}
