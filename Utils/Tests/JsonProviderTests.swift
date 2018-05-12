//
//  JsonProviderTests.swift
//  UtilsTests
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import XCTest
@testable import Utils

class JsonProviderTests: XCTestCase {
    
    func testGetMethodShouldReturnAJsonObject() {
        // Given
        let sut = JsonProvider()

        // When
        let json = try? sut.jsonObjectFromLocalFile(named: "formatted")

        // Then
        XCTAssertNotNil(json)
    }

    func testShouldParseJsonProperly() {
        // Given
        let sut = JsonProvider()
        
        // When
        let json = try? sut.jsonObjectFromLocalFile(named: "formatted")
        
        // Then
        XCTAssertNotNil(json)
        XCTAssertNotNil(json!["id"] as! String)
        XCTAssertEqual(json!["id"] as! String, "test")
    }

    func testShouldThrowErrorWhenJsonFileDoesNotExist() {
        // Given
        let sut = JsonProvider()
        
        // When
        XCTAssertThrowsError(try sut.jsonObjectFromLocalFile(named: "arquivo nao existente")) {
            // Then
            XCTAssertEqual($0 as? FileError, FileError.notFound)
        }
    }
    
    func testShouldThrowErrorWhenJsonFileHasMalformedJson() {
        // Given
        let sut = JsonProvider()

        // When
        XCTAssertThrowsError(try sut.jsonObjectFromLocalFile(named: "malformed")) {
            // Then
            do {
                guard let error = $0 as? JsonError else {
                    XCTFail()
                    return
                }
                XCTAssertEqual(error, JsonError.malformed)
            }
        }
    }
}


