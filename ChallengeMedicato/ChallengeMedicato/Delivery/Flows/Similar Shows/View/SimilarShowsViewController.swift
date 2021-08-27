//
//  SimilarShowsView.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//


import UIKit

class SimilarShowsViewController: UIViewController {
    
    @IBOutlet weak var popularDetails: PopularDetailsView!
    @IBOutlet weak var similarView: SimilarShowView!
    
    private var presenter: SimilarShowsPresenter
    
    init(presenter: SimilarShowsPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        popularDetails.configure(data: presenter.element)
        configureDelegate()
        similarShows()
        configureKIF()
    }
    
    func configureKIF() {
        similarView.accessibilityIdentifier = Localizable.SimilarShows.collectionView.localized
        similarView.accessibilityLabel = Localizable.SimilarShows.collectionView.localized
    }
    
    func configureDelegate() {
        similarView.delegate = self
    }
    
    func similarShows() {
        showHud()
        presenter.similarShows { [weak self] result in
            guard let self = self else { return }
            self.hideHud()
            switch result {
            case .failure:
                self.showErrorHud()
            case .success:
                self.similarView.configure(data: self.presenter.similarItemsResult)
            }
        }
    }
    
}

extension SimilarShowsViewController: SimilarShowViewProtocol {
    
    func didSelectItemAt(data: PopularResultDTO) {
        popularDetails.configure(data: data)
    }
    
    func loadNextPage() {
        presenter.page += 1
        similarShows()
    }
}
