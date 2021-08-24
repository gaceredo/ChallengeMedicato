//
//  SimilarShowsView.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import UIKit

protocol SimilarShowsViewProtocol {
    
}

class SimilarShowsViewController: UIViewController, SimilarShowsViewProtocol {
    
    private var presenter: SimilarShowsPresenter
    
    init(presenter: SimilarShowsPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
