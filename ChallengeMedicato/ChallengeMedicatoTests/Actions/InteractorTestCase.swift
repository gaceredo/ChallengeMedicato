//
//  InteractorTestCase.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import XCTest

class InteractorTestCase: XCTestCase {
    
    var similarShowsInteractor: SimilarShowsInteractorMock!
    var popularShowsInteractor: PopularShowsInteractorMock!
    
    override func setUpWithError() throws {
        
        similarShowsInteractor = SimilarShowsInteractorMock()
        popularShowsInteractor = PopularShowsInteractorMock()
        
        similarShowsInteractor.stubbedExecuteCompletionResult = CreatePopularShow.elements
        popularShowsInteractor.stubbedExecuteCompletionResult = CreatePopularShow.elements
    }
    
    override func tearDownWithError() throws {
        similarShowsInteractor = nil
        popularShowsInteractor = nil
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testExecute_similarShows() {
        XCTAssertFalse(similarShowsInteractor.invokedExecute )
        XCTAssertTrue(similarShowsInteractor.invokedExecuteParametersId == 0 )
        XCTAssertTrue(similarShowsInteractor.invokedExecuteCount == 0 )
        XCTAssertTrue(similarShowsInteractor.invokedExecuteParametersList.isEmpty)
        XCTAssertNotNil(similarShowsInteractor.stubbedExecuteCompletionResult)
        let testExpectation = expectation(description: "lalala")
        similarShowsInteractor.similarShows(query: [URLQueryItem(name: "key", value: "value")],
                                            tv: 123) { result in
            
            switch result {
            case .failure:
                XCTFail()
            case .success:
                XCTAssertTrue(self.similarShowsInteractor.invokedExecute )
                XCTAssertTrue(self.similarShowsInteractor.invokedExecuteParametersId == 123 )
                XCTAssertFalse(self.similarShowsInteractor.invokedExecuteParametersList.isEmpty)
                testExpectation.fulfill()
            }
        }
        wait(for: [testExpectation], timeout: 0.1)
    }
    
    func testExecute_popularShows() {

        XCTAssertFalse(popularShowsInteractor.invokedExecute )
        XCTAssertTrue(popularShowsInteractor.invokedExecuteCount == 0 )
        XCTAssertTrue(popularShowsInteractor.invokedExecuteParametersList.isEmpty)
        XCTAssertNotNil(popularShowsInteractor.stubbedExecuteCompletionResult)
        
        let testExpectation = expectation(description: "lalala")
        popularShowsInteractor.popularShows(query: [URLQueryItem(name: "key", value: "value")]) { result in
            switch result {
            case .failure:
                XCTFail()
            case .success:
                XCTAssertTrue(self.popularShowsInteractor.invokedExecute )
                XCTAssertFalse(self.popularShowsInteractor.invokedExecuteParametersList.isEmpty)
                testExpectation.fulfill()
            }
        }
        wait(for: [testExpectation], timeout: 0.1)
    }
    
}
