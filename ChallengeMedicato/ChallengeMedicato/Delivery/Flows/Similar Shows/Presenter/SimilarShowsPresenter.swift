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
    var property: String { get set }
}

final class SimilarShowsPresenter: SimilarShowsPresenterProtocol, ObservableObject {
    @Published var property: String = "" {
        didSet {
            
        }
    }
    
    private let interactor: SimilarShowsInteractorProtocol
    
    init(interactor: SimilarShowsInteractorProtocol) {
        self.interactor = interactor
    }
}
