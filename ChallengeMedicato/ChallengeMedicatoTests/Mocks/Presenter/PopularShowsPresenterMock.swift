//
//  PopularShowsPresenterMock.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import Foundation
@testable import ChallengeMedicato

class PopularShowsPresenterMock: PopularShowsPresenterProtocol {
    
    var popularItems: PopularDTO?
    var popularResult: [PopularResultDTO] = []
    var invokedExecute = false
    var invokedExecuteCount = 0
    var isSuccess: Bool = true
    
    func popularShows(completion: @escaping (Result<Void, Error>) -> Void) {
        invokedExecute = true
        invokedExecuteCount += 1
        completion( isSuccess ? .success(()) : .failure(ResponseError.badGateway))
    }
    
}
