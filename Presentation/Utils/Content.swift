//
//  Content.swift
//  Presentation
//
//  Created by Willian on 13/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation

enum Content<T> {
    case success(T)
    case error(UserError)
    case empty
    case loading
}

struct UserError: Error {
    let title: String
    let localizedDescription: String
    let style: ErrorStyle
    
    enum ErrorStyle {
        case alert
        case embeded
        case toast
    }
}
