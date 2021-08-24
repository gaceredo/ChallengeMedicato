//
//  PopularShowsView.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import UIKit

protocol PopularShowsViewProtocol {
    
}

class PopularShowsViewController: UIViewController, PopularShowsViewProtocol {
    
    private var presenter: PopularShowsPresenter
    
    init(presenter: PopularShowsPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.popularShows(completion:  {
            
        })
    }
}
