//
//  PopularShowsInteractorDependenciesMock.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import Foundation
import Combine
@testable import ChallengeMedicato

class PopularShowsInteractorDependenciesMock: PopularShowsInteractorDependenciesProtocol {
    
    var invokedExecute = false
    var invokedExecuteCount = 0
    var invokedExecuteParametersList : [URLQueryItem] = []
    var invokedExecuteFeedKing: Feed?
    var stubbedExecuteCompletionResult: AnyPublisher<PopularDTO, Error>!
    var request = RequestProtocolMock(configuration: .default)
    
    func popularShows(query: [URLQueryItem],
                      _ feedKind: Feed) -> AnyPublisher<PopularDTO, Error> {
        invokedExecute = true
        invokedExecuteCount += 1
        invokedExecuteFeedKing = feedKind
        invokedExecuteParametersList = query
        return request.execute(feedKind.request(query: query),
                               decodingType: PopularDTO.self,
                               queue: .main,
                               retries: 1)
    }
    
}


