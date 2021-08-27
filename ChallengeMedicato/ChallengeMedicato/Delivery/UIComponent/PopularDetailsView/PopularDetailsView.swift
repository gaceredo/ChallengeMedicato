//
//  PopularDetailsView.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import UIKit
import Kingfisher


class PopularDetailsView: ReusableView {

    @IBOutlet weak var popularDetailsTitle: UILabel!
    @IBOutlet weak var popularDetailsImage: UIImageView!
    @IBOutlet weak var popularDetailsDescription: UILabel!
    @IBOutlet weak var popularDetailsDate: UILabel!
    @IBOutlet weak var popularDetailsAverage: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableViewCell()
        configureKIF()
    }
    private func setupTableViewCell() {
        popularDetailsTitle.font = .helveticaNeueBold(size: 16)
        popularDetailsDescription.font = .helveticaNeueMedium(size: 14)
        popularDetailsAverage.font = .helveticaNeueBold(size: 12)
        popularDetailsDate.font = .helveticaNeueBold(size: 12)
        popularDetailsImage.makeRoundCorners(byRadius: 16)
    }
    
    func configureKIF() {
        accessibilityIdentifier = Localizable.PopularShows.details.localized
        accessibilityLabel = Localizable.PopularShows.details.localized
    }
    func configure(data: PopularResultDTO) {
        
        popularDetailsTitle.text = data.name
        popularDetailsDescription.text = data.overview
        popularDetailsAverage.text = "Average: \(data.voteAverage.description)"
        popularDetailsDate.text = "Date: \(data.firstAirDate)"
        
        if let path = data.posterPath {
            let url = URL(string: Path.baseImage + path)
            popularDetailsImage.kf.setImage(with: url)
        }
    }
}

