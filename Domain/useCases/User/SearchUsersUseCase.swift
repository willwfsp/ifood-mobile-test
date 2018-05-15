//
//  SearchUsersUseCase.swift
//  Domain
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

public extension SearchUsersUseCase {
    public struct Request {
        public let term: String
        public init(term: String) {
            self.term = term
        }
    }
}

public struct SearchUsersUseCase: UseCase {
    public typealias T = [User]
    public typealias R = Request
    
    let userRepository: UserRepository
    let sessionRepository: SessionRepository
    
    public init(userRepository: UserRepository, sessionRepository: SessionRepository) {
        self.userRepository = userRepository
        self.sessionRepository = sessionRepository
    }

    public func execute(request: Request? = nil, completion: @escaping (Result<[User]>) -> ()) {
        guard let request = request else {
            completion(.failure(DomainError.missingRequest(onUseCase: "SearchUsersUseCase")))
            return
        }
        
        sessionRepository.getSessionUserId {
            switch $0 {
            case let .success:
                self.userRepository.searchUsers(term: request.term) { completion($0) }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
