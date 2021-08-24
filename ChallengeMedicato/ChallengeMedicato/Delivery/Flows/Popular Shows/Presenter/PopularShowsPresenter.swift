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
    func popularShows(completion: @escaping () -> Void)
}

final class PopularShowsPresenter: PopularShowsPresenterProtocol, ObservableObject {
    
    @Published var popularItems: PopularDTO?
    private let interactor: PopularShowsInteractorProtocol
    
    init( interactor: PopularShowsInteractorProtocol) {
        self.interactor = interactor
    }
    
    func popularShows(completion: @escaping () -> Void) {
        
        let query = [URLQueryItem(name: Keys.apiKey, value: Constants.apiKey),
                     URLQueryItem(name: Keys.page, value: "1")]
        
        interactor.popularShows(query: query) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let element):
                self.popularItems = element
            case .failure(let error):
                print(error)
            }
        }
    }
}
