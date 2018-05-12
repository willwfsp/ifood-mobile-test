//
//  SearchUsersUseCaseTests.swift
//  DomainTests
//
//  Created by Willian on 11/05/2018.
//  Copyright © 2018 Willian. All rights reserved.
//

import XCTest
import Utils
@testable import Domain

class SearchUsersUseCaseTests: XCTestCase {
    
    func test_execute_whenRequestIsNotProvided_thenCompleteWithError() {
        // Given
        let sut = makeSut()
        let expectation = self.expectation(description: "expecting an error")
        var result: Result<[User]>? = nil
        
        // When
        sut.execute() {
            result = $0
            expectation.fulfill()
        }
        
        waitForExpectations()
        
        // Then

        guard let error = result?.error as? DomainError else {
            XCTFail()
            return
        }
        XCTAssertEqual(error, DomainError.missingRequest(onUseCase: "SearchUsersUseCase"))
    }
    
    func test_execute_whenRequestIsProvided_theRepositoryShouldBeCalled() {
        // Given
        let sut = makeSut()
        let expectation = self.expectation(description: "expecting an result")
        var result: Result<[User]>? = nil
        let request = SearchUsersUseCase.Request(term: "some term")
        
        // When
        sut.execute(request: request) {
            result = $0
            expectation.fulfill()
        }
        
        // Then
        waitForExpectations()
        XCTAssertNotNil(result)
    }
}

// MARK: Helpers

extension SearchUsersUseCaseTests {
    func makeSut() -> SearchUsersUseCase {
        let repository = UserRepositorySpy()
        return SearchUsersUseCase(repository: repository)
    }
}
