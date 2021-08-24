//
//  SimilarShowsWireFrame.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import UIKit

protocol SimilarShowsWireFrameProtocol {
   static func makeSimilarShowsView() -> UIViewController
}

struct SimilarShowsWireFrame: SimilarShowsWireFrameProtocol {
    
    static func makeSimilarShowsView() -> UIViewController {
        let interactorDependencies = SimilarShowsInteractorDependencies()
        let interactor = SimilarShowsInteractor(dependencies: interactorDependencies)
        let presenter = SimilarShowsPresenter(interactor: interactor)
        let view = SimilarShowsViewController(presenter: presenter)
        
        return view
    }
}
