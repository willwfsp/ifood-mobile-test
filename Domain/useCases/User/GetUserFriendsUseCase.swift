//
//  GetUserFriendsUseCase.swift
//  Domain
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

extension GetUserFriendsUseCase {
    struct Request {
        let userId: String
    }
}

struct GetUserFriendsUseCase: UseCase {
    typealias T = [User]
    typealias R = Request
    
    let repository: UserRepository
    
    public init(repository: UserRepository) {
        self.repository = repository
    }
    
    func execute(request: Request? = nil, completion: @escaping (Result<[User]>) -> ()) {
        guard let request = request else {
            completion(.failure(error: DomainError.missingRequest(onUseCase: "GetUserFriendsUseCase")))
            return
        }
        repository.friends(userId: request.userId) { completion($0) }
    }
}
