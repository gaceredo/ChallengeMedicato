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
    var property: String { get set }
}

final class PopularShowsPresenter: PopularShowsPresenterProtocol, ObservableObject {
    
    @Published var property: String = "" {
        didSet {
            
        }
    }
    
    private let interactor: PopularShowsInteractorProtocol
    
    init( interactor: PopularShowsInteractorProtocol) {
        self.interactor = interactor
    }
}
