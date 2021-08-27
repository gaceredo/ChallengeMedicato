//
//  SimilarShowsInteractorDependencies.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import Foundation
import Combine

protocol SimilarShowsInteractorDependenciesProtocol {
    func similarShows(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher< PopularDTO, Error>
}
class SimilarShowsInteractorDependencies: RequestProtocol, SimilarShowsInteractorDependenciesProtocol {
    
    var session: URLSession
    var error: ResponseHandlingError
    
    init(configuration: URLSessionConfiguration,
         error: ResponseHandlingError = ResponseHandlingError()) {
        self.session = URLSession(configuration: configuration)
        self.error = error
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    func similarShows(query: [URLQueryItem],_ feedKind: Feed) -> AnyPublisher< PopularDTO, Error> {
        execute(feedKind.request(query: query), decodingType: PopularDTO.self, retries: 1)
    }
}

