//
//  InteractorDependenciesTestCase.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import XCTest
import Combine

@testable import ChallengeMedicato


class InteractorDependenciesTestCase: XCTestCase {
    
    var popular: PopularShowsInteractorDependenciesMock!
    var cancellable: AnyCancellable?
    
    override func setUpWithError() throws {
        popular = PopularShowsInteractorDependenciesMock()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        popular = nil
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testExecute_popularShowSuccess()  {
        popular.request.name = "popularShows"
        popular.request.statusCode = 200
        let testExpectation = expectation(description: "networkService")
        cancellable = popular.popularShows(query: [], .popular)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished : break
                case .failure:
                    XCTFail()
                }
            },
            receiveValue: {
                XCTAssertNotNil($0.results)
                XCTAssertEqual($0.results[0].name, "What If...?")
                testExpectation.fulfill()
            })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testExecute_popularShowFailure()  {
        popular.request.name = "popularShowsError"
        popular.request.statusCode = 400
        
        let testExpectation = expectation(description: "networkService")
        cancellable = popular.popularShows(query: [], .popular)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished : break
                case .failure:
                    XCTAssert(true)
                    testExpectation.fulfill()
                }
            },
            receiveValue: { _ in
                XCTFail()
            })
        self.waitForExpectations(timeout: 10.0, handler: nil)
    }
}
