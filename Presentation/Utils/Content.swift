//
//  Content.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation

public enum Content<T> {
    case data(T)
    case error(UserError)
    case empty
    case loading
}

public struct UserError: Error {
    let title: String
    let localizedDescription: String
    let style: ErrorStyle
    
    enum ErrorStyle {
        case alert
        case embeded
        case toast
    }
}
