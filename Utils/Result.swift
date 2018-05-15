//
//  Result.swift
//  Utils
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import Foundation

public enum Result<T> {
    case success(T)
    case failure(Error)
    
    public var data: T? {
        if case let .success(data) = self {
            return data
        }
        return nil
    }
    
    public var error: Error? {
        if case let .failure(error) = self {
            return error
        }
        return nil
    }
}
