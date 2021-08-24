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
    var similarItems: SimilarDTO? { get set }
    var tvId: Int { get }
    func popularShows(completion: @escaping () -> Void)
}

final class SimilarShowsPresenter: SimilarShowsPresenterProtocol, ObservableObject {
    
    @Published var similarItems: SimilarDTO?
    var tvId: Int
    private let interactor: SimilarShowsInteractorProtocol
    
    init(interactor: SimilarShowsInteractorProtocol, tvId: Int) {
        self.interactor = interactor
        self.tvId = tvId
    }
    
    func popularShows(completion: @escaping () -> Void) {
        
        interactor.similarShows(query: [], tv: tvId) {  [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let element):
                self.similarItems = element
            case .failure(let error):
                print(error)
            }
        }
    }
}
