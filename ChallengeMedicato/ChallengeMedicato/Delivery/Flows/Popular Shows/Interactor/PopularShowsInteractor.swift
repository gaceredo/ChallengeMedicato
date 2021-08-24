//
//  PopularShowsInteractor.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import Foundation
import Combine

protocol PopularShowsInteractorProtocol {
    func popularShows(query: [URLQueryItem],completion: @escaping (Result< PopularDTO, Error>) -> Void)
}

final class PopularShowsInteractor: PopularShowsInteractorProtocol {
    
    private let dependencies: PopularShowsInteractorDependencies
    private var cancellable: AnyCancellable?
    
    init(dependencies: PopularShowsInteractorDependencies) {
        self.dependencies = dependencies
    }
    
    func popularShows(query: [URLQueryItem], completion: @escaping (Result<PopularDTO, Error>) -> Void) {
        cancellable = dependencies.popularShows(query: query, .popular)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished : break
                case .failure(let error):
                    completion(.failure(error))
                }
            },
            receiveValue: {
                completion(.success($0))
            })
    }
}
