//
//  SimilarShowsInteractorDependenciesMock.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import Foundation
import Combine
@testable import ChallengeMedicato

class SimilarShowsInteractorDependenciesMock: SimilarShowsInteractorDependenciesProtocol {
       
    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteParametersList : [URLQueryItem] = []
    var invokedExecuteFeedKing: Feed?
    var stubbedExecuteCompletionResult: AnyPublisher<PopularDTO, Error>!

    func similarShows(query: [URLQueryItem], _ feedKind: Feed) -> AnyPublisher<PopularDTO, Error> {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteFeedKing = feedKind
        invokedExecuteParametersList = query
        return stubbedExecuteCompletionResult
    }
    
}

