//
//  PopularShowsInteractorMock.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import Foundation
@testable import ChallengeMedicato

class PopularShowsInteractorMock: PopularShowsInteractorProtocol {
   
    var invokedExecute = false
    var invokedExecuteCount = 0
    var stubbedExecuteCompletionResult: PopularDTO?
    var invokedExecuteParametersList = [URLQueryItem]()
    
    func popularShows(query: [URLQueryItem],
                      completion: @escaping (Result<PopularDTO, Error>) -> Void) {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteParametersList = query
        if let result = stubbedExecuteCompletionResult {
            completion(.success(result))
        } else {
            completion(.failure(ResponseError.badGateway))
        }
    }
}

