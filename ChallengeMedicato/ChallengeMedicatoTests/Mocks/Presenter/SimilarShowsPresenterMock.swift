//
//  SimilarShowsPresenterMock.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import Foundation
@testable import ChallengeMedicato

class SimilarShowsPresenterMock: SimilarShowsPresenterProtocol {
    
    var similarItems: PopularDTO?
    var element: PopularResultDTO
    var invokedExecute = false
    var invokedExecuteCount = 0
    var isSuccess: Bool = true

    init(element: PopularResultDTO) {
        self.element = element
    }
    
    func similarShows(completion: @escaping (Result<Void, Error>) -> Void) {
        invokedExecute = true
        invokedExecuteCount += 1
        completion( isSuccess ? .success(()) : .failure(ResponseError.badGateway))
    }
}
