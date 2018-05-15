//
//  Errors.swift
//  Domain
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation
import Utils

public enum DomainError: DescribableError {
    case missingRequest(onUseCase: String)
    case unknown
    
    public var localizedDescription: String {
        switch self {
        case let .missingRequest(useCase):
            return "The useCase \(useCase) requires an request to procceed"
        case .unknown:
            return "Something wrong happened"
        }
    }
    
    public var title: String {
        return "Domain Error"
    }
}

extension DomainError: Equatable {
    public static func ==(lhs: DomainError, rhs: DomainError) -> Bool {
        
        switch (lhs, rhs) {
        case let (.missingRequest(l), .missingRequest(r)):
            return l == r
        case (.unknown, .unknown): return true
        default: return false
        }
    }
}
