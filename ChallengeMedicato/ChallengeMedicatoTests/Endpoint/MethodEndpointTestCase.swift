//
//  EndPointMock.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import XCTest
@testable import ChallengeMedicato

class MethodEndpointTestCase: XCTestCase {
    let endpoint: MethodEndpoint =  MethodEndpoint(endPoint: EndPointMock())

    func testEndpoint_Method() throws {
        XCTAssertEqual(endpoint.httpMethod, .POST )
    }

    func testEndpoint_path() throws {
        XCTAssertEqual(endpoint.path, "/populate")
    }

    func testEndpoint_baseURL() throws {
        XCTAssertEqual(endpoint.base, "https://api.themoviedb.org")
    }

    func testEndpoint_start() throws {
        endpoint.start()
        XCTAssertTrue(endpoint.invokedExecute)
        XCTAssertTrue(endpoint.invokedExecuteCount == 1)
    }
}

