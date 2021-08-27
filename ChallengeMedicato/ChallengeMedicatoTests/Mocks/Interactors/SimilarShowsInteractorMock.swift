//
//  SimilarShowsInteractorMock.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import Foundation
@testable import ChallengeMedicato

class SimilarShowsInteractorMock: SimilarShowsInteractorProtocol {
    
    var invokedExecute = false
    var invokedExecuteCount = 0
    var stubbedExecuteCompletionResult: PopularDTO?
    var invokedExecuteParametersId: Int = 0
    var invokedExecuteParametersList : [URLQueryItem] = []
    
    func similarShows(query: [URLQueryItem],
                      tv id: Int,
                      completion: @escaping (Result<PopularDTO, Error>) -> Void) {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteParametersId = id
        invokedExecuteParametersList = query
        if let result = stubbedExecuteCompletionResult {
            completion(.success(result))
        } else {
            completion(.failure(ResponseError.badGateway))
        }
    }
}
