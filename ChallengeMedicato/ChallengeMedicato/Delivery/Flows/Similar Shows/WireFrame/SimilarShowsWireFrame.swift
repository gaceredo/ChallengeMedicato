//
//  SimilarShowsWireFrame.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import UIKit

protocol SimilarShowsWireFrameProtocol {
    func makeSimilarShowsView(popular element: PopularResultDTO)
}

struct SimilarShowsWireFrame: SimilarShowsWireFrameProtocol {
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func makeSimilarShowsView(popular element: PopularResultDTO) {
        let interactorDependencies = SimilarShowsInteractorDependencies()
        let interactor = SimilarShowsInteractor(dependencies: interactorDependencies)
        let presenter = SimilarShowsPresenter(interactor: interactor, element: element)
        let view = SimilarShowsViewController(presenter: presenter)
        self.navigationController.pushViewController(view, animated: true)
    }
}
