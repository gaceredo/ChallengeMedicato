//
//  SimilarShowsWireFrame.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import UIKit

protocol SimilarShowsWireFrameProtocol {
    func makeSimilarShowsView(tv id: Int)
}

struct SimilarShowsWireFrame: SimilarShowsWireFrameProtocol {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func makeSimilarShowsView(tv id: Int) {
        let interactorDependencies = SimilarShowsInteractorDependencies()
        let interactor = SimilarShowsInteractor(dependencies: interactorDependencies)
        let presenter = SimilarShowsPresenter(interactor: interactor, tvId: id)
        let view = SimilarShowsViewController(presenter: presenter)
        self.navigationController.pushViewController(view, animated: true)
    }
}
