//
//  SimilarShowsInteractor.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import Foundation
import Combine

protocol SimilarShowsInteractorProtocol {
    func similarShows(query: [URLQueryItem],tv id: Int, completion: @escaping (Result< PopularDTO, Error>) -> Void)
}

final class SimilarShowsInteractor: SimilarShowsInteractorProtocol {
    
    private let dependencies: SimilarShowsInteractorDependencies
    private var cancellable: AnyCancellable?
    
    init(dependencies: SimilarShowsInteractorDependencies) {
        self.dependencies = dependencies
    }
    
    func similarShows(query: [URLQueryItem], tv id: Int, completion: @escaping (Result<PopularDTO, Error>) -> Void) {
        cancellable = dependencies.similarShows(query: query, .similar(id: id))
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
