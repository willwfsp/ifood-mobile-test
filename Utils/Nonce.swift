//
//  Nonce.swift
//  Utils
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import Foundation

public struct Nonce {
    public static func make() -> String {
        let temp = UUID().uuidString
        return temp.replacingOccurrences(of: "-", with: "")
    }
}
