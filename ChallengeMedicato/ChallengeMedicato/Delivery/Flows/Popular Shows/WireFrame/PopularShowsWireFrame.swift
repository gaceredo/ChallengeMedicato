//
//  PopularShowsWireFrame.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import UIKit

protocol PopularShowsWireFrameProtocol {
   static func makePopularShowsView() -> UIViewController
}

struct PopularShowsWireFrame: PopularShowsWireFrameProtocol {
    
    static func makePopularShowsView() -> UIViewController {
        let interactorDependencies = PopularShowsInteractorDependencies()
        let interactor = PopularShowsInteractor(dependencies: interactorDependencies)
        let presenter = PopularShowsPresenter(interactor: interactor)
        let view = PopularShowsViewController(presenter: presenter)
        return view
    }
}
