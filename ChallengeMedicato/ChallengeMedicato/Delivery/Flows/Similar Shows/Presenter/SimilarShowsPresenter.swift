//
//  SimilarShowsPresenter.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import Foundation
import Combine

protocol SimilarShowsPresenterProtocol {
    var similarItems: PopularDTO? { get set }
    var element: PopularResultDTO { get }
    func similarShows(completion: @escaping (Result<Void, Error>) -> Void)
}

final class SimilarShowsPresenter: SimilarShowsPresenterProtocol, ObservableObject {
    
    var similarItems: PopularDTO? {
        didSet {
            similarItemsResult.append(contentsOf: similarItems?.results ?? [])
        }
    }
    
    var similarItemsResult: [PopularResultDTO] = []
    var element: PopularResultDTO
    var page: Int = 1
    
    private let interactor: SimilarShowsInteractorProtocol
    
    init(interactor: SimilarShowsInteractorProtocol, element: PopularResultDTO) {
        self.interactor = interactor
        self.element = element
    }
    
    func similarShows(completion: @escaping (Result<Void, Error>) -> Void) {

        let query = [URLQueryItem(name: Keys.apiKey, value: Constants.apiKey),
                     URLQueryItem(name: Keys.page, value: "\(page)")]

        interactor.similarShows(query: query, tv: element.id) {  [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let element):
                self.similarItems = element
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
