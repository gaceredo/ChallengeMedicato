//
//  SimilarShowsInteractor.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import Foundation

protocol SimilarShowsInteractorProtocol {
    
}

final class SimilarShowsInteractor: SimilarShowsInteractorProtocol {
    private let dependencies: SimilarShowsInteractorDependenciesProtocol
    
    init(dependencies: SimilarShowsInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}
