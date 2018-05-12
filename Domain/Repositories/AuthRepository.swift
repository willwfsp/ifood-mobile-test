//
//  AuthRepository.swift
//  Domain
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation

public protocol AuthRepository {
    func authenticate(completion: @escaping (Bool) -> ())
}
