//
//  XCTest.swift
//  Utils
//
//  Created by Willian on 12/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import XCTest

extension XCTestCase {
    func waitForExpectations(timeout: UInt = 1) {
        waitForExpectations(timeout: 1, handler: nil)
    }
}
