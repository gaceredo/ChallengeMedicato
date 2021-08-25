//
//  PopularShowsPresenter.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import Foundation
import Combine

protocol PopularShowsPresenterProtocol {
    var popularItems: PopularDTO? { get set }
    var popularResult: [PopularResultDTO] { get set }
    func popularShows(completion: @escaping (Result<Void, Error>) -> Void)
}

final class PopularShowsPresenter: PopularShowsPresenterProtocol, ObservableObject {
    
   var popularItems: PopularDTO? {
        didSet {
            popularResult.append(contentsOf: popularItems?.results ?? [])
        }
    }
    
    @Published var popularResult: [PopularResultDTO] = []
    
    private let interactor: PopularShowsInteractorProtocol
    var page: Int = 1
    
    init( interactor: PopularShowsInteractorProtocol) {
        self.interactor = interactor
    }
    
    func popularShows(completion: @escaping (Result<Void, Error>) -> Void) {
        
        let query = [URLQueryItem(name: Keys.apiKey, value: Constants.apiKey),
                     URLQueryItem(name: Keys.page, value: "\(page)")]
        
        interactor.popularShows(query: query) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let element):
                self.popularItems = element
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
