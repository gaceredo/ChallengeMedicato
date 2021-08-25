//
//  PopularShowsViewController+TableView.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import UIKit

extension PopularShowsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.popularResult.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PopularShowsTableViewCell = tableView.dequeueReusableaCell(forIndexPath: indexPath)
        cell.configure(data: presenter.popularResult[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let navigationController = self.navigationController {
            let id = presenter.popularResult[indexPath.row].id
            let view = SimilarShowsWireFrame(navigationController: navigationController)
            view.makeSimilarShowsView(tv: id)
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if presenter.popularResult.count == indexPath.row + 1 {
            presenter.page += 1
            popularShows()
        }
    }
}
