//
//  PopularShowsInteractor.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import Foundation

protocol PopularShowsInteractorProtocol {
    
}

final class PopularShowsInteractor: PopularShowsInteractorProtocol {
    private let dependencies: PopularShowsInteractorDependenciesProtocol
    
    init(dependencies: PopularShowsInteractorDependenciesProtocol) {
        self.dependencies = dependencies
    }
}
