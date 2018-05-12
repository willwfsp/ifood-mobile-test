//
//  SearchUsersUseCase.swift
//  Domain
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

extension SearchUsersUseCase {
    struct Request {
        let term: String
    }
}

struct SearchUsersUseCase: UseCase {
    typealias T = [User]
    typealias R = Request
    
    let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute(request: Request? = nil, completion: @escaping (Result<[User]>) -> ()) {
        guard let request = request else {
            completion(.failure(error: DomainError.missingRequest(onUseCase: "SearchUsersUseCase")))
            return
        }
        repository.searchUsers(term: request.term) { completion($0) }
    }
}
