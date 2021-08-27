//
//  MethodEndpointMock.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import Foundation
@testable import ChallengeMedicato


class MethodEndpoint {
    
    var path: String
    var httpMethod: RequestMethod
    var base : String
    
    var invokedExecute = false
    var invokedExecuteCount = 0
    
    init(endPoint: Endpoint) {
        self.path = endPoint.path
        self.httpMethod = endPoint.httpMethod
        self.base = endPoint.base
    }

    func start() {
        invokedExecute = true
        invokedExecuteCount += 1
    }
    
}

class EndPointMock: Endpoint {
    var path: String = "/populate"
    var httpMethod: RequestMethod = .POST
    var headers: [String : String] = [:]
    var base: String = "https://api.themoviedb.org"
}
