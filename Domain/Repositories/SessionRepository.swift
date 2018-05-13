//
//  SessionRepository.swift
//  Domain
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

public protocol SessionRepository {
    func getSessionUserId(completion: @escaping (Result<String>) -> ())
}
