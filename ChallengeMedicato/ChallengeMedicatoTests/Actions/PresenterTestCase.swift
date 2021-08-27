//
//  PresenterTestCase.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import XCTest
@testable import ChallengeMedicato

class PresenterTestCase: XCTestCase {
    var elemen = CreatePopularShow.elements
    
    var populate: PopularShowsPresenterMock!
    var similar: SimilarShowsPresenterMock!
    
    override func setUpWithError() throws {
        populate = PopularShowsPresenterMock()
        similar = SimilarShowsPresenterMock(element: elemen.results[0])
        populate.popularItems = elemen
        populate.popularResult = elemen.results
    }
    
    override func tearDownWithError() throws {
        populate = nil
        similar = nil
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testExecute_popularItems() {
        XCTAssertNotNil(populate.popularItems)
        XCTAssertEqual(populate.popularItems?.results.count, elemen.results.count )
    }
    
    // Popular Test
    func testExecute_popularResultSucces() {
        let testExpectation = expectation(description: "lalala")
        populate.isSuccess = true
        populate.popularShows { result in
            switch result {
            case .failure:
                XCTFail()
            case .success:
                XCTAssert(true)
                testExpectation.fulfill()
            }
        }
        wait(for: [testExpectation], timeout: 0.1)
    }
    
    func testExecute_popularResultFailure() {
        let testExpectation = expectation(description: "lalala")
        populate.isSuccess = false
        populate.popularShows { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription,
                               ResponseError.badGateway.localizedDescription)
                testExpectation.fulfill()
            case .success:
                XCTFail()
                
            }
        }
        wait(for: [testExpectation], timeout: 0.1)
    }
    
    // Similar Test
    
    func testExecute_similarResultSuccess() {
        let testExpectation = expectation(description: "lalala")
        similar.isSuccess = true
        similar.similarShows { result in
            switch result {
            case .failure:
                XCTFail()
            case .success:
                XCTAssert(true)
                testExpectation.fulfill()
                
            }
        }
        wait(for: [testExpectation], timeout: 0.1)
    }
    
    func testExecute_similarResultFailure() {
        let testExpectation = expectation(description: "lalala")
        similar.isSuccess = false
        similar.similarShows { result in
            switch result {
            case .failure(let error):
                XCTAssertEqual(error.localizedDescription,
                               ResponseError.badGateway.localizedDescription)
                testExpectation.fulfill()
            case .success:
                XCTFail()
                
            }
        }
        wait(for: [testExpectation], timeout: 0.1)
    }
}
