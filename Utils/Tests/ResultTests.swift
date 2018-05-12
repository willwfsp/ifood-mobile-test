//
//  UtilsTests.swift
//  UtilsTests
//
//  Created by Willian Fagner Souza Polici on 04/05/18.
//  Copyright © 2018 Willian Fagner Souza Polici. All rights reserved.
//

import XCTest
@testable import Utils

class ResultTests: XCTestCase {

    func testSuccessShouldPassAnyDataThroughCase() {
        // Given
        let data = "Given String"
        let sut = Result<String>.success(data: data)
        
        // When
        let disclosuredData = sut.data!
        
        // Then
        XCTAssertEqual(data, disclosuredData)
    }
    
    func testFailureShouldPassAnyErrorThroughCase() {
        // Given
        let error = ResultErrorSpy.somethingWrong
        let sut = Result<String>.failure(error: error)
        
        // When
        let disclosuredError = sut.error as! ResultErrorSpy
        
        // Then
        XCTAssertEqual(error, disclosuredError)
    }
    
    func testShouldReturnNilDataWhenTheResultIsFailure() {
        // Given
        let sut = Result<String>.failure(error: NSError())
        
        // When
        let data = sut.data
        
        // Then
        XCTAssertNil(data)
    }
    
    func testShouldReturnNilErrorWhenTheResultIsSuccess() {
        // Given
        let sut = Result<String>.success(data: "")
        
        // When
        let error = sut.error
        
        // Then
        XCTAssertNil(error)
    }
}

enum ResultErrorSpy: Error {
    case somethingWrong
}
