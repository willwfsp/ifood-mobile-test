//
//  GetUserTimelineUseCase.swift
//  Domain
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

public extension GetUserTimelineUseCase {
    struct Request {
        let userId: String
        
        public init(userId: String)  {
            self.userId = userId
        }
    }
}

public struct GetUserTimelineUseCase: UseCase {
    public typealias T = [Tweet]
    public typealias R = Request
    
    let userRepository: UserRepository
    let sessionRepository: SessionRepository
    
    public init(userRepository: UserRepository, sessionRepository: SessionRepository) {
        self.userRepository = userRepository
        self.sessionRepository = sessionRepository
    }
    
    public func execute(request: Request? = nil, completion: @escaping (Result<[Tweet]>) -> ()) {
        guard let userId = request?.userId else {
            completion(.failure(error: DomainError.missingRequest(onUseCase: "GetUserTimelineUseCase")))
            return
        }
        
        sessionRepository.getSessionUserId {
            switch $0 {
            case .success:
                self.userRepository.timeline(userId: userId) { completion($0) }
            case let .failure(error):
                completion(.failure(error: error))
            }
        }
        
    }
}

