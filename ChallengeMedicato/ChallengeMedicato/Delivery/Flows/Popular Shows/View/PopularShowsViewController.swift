//
//  PopularShowsView.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//  
//

import UIKit

class PopularShowsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var zeroResult: ZeroResultView!
    
    var presenter: PopularShowsPresenter
    
    init(presenter: PopularShowsPresenter) {
        self.presenter = presenter
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupTableView()
        popularShows()
        configureKIF()
    }
    
    func configureKIF() {
        tableView.accessibilityIdentifier = Localizable.PopularShows.tableView.localized
        tableView.accessibilityLabel = Localizable.PopularShows.tableView.localized
    }
    
    func popularShows() {
        showHud()
        presenter.popularShows { [weak self] result in
            guard let self = self else {
                return
            }
            self.hideHud()
            switch result {
            case .success:
                self.finishLoading()
            case .failure:
                self.showErrorHud()
            }
        }
    }
    
    private func setupTitle() {
        self.title = Localizable.PopularShows.title.localized
    }
    
    private func setupTableView() {
        tableView.hideFooterView()
        tableView.registerNib(PopularShowsTableViewCell.self)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func finishLoading() {
        tableView.isHidden = presenter.popularResult.isEmpty
        zeroResult.isHidden = !presenter.popularResult.isEmpty
        tableView.reloadData()
    }
}

