//
//  UseCase.swift
//  Domain
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation
import Utils

public protocol UseCase {
    associatedtype T
    associatedtype R
    func execute(request: R?, completion: @escaping (Result<T>) -> ())
}
