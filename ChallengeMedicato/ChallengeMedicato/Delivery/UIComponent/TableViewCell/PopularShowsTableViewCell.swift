//
//  PopularShowsTableViewCell.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import UIKit
import Kingfisher

class PopularShowsTableViewCell: UITableViewCell, ConfigurableCell {

    @IBOutlet weak var popularShowsImage: UIImageView!
    @IBOutlet weak var popularShowsName: UILabel!
    @IBOutlet weak var popularShowsAverage: UILabel!
    @IBOutlet weak var popularShowsDetails: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableViewCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    private func setupTableViewCell() {
        popularShowsName.font = .helveticaNeueMedium(size: 14)
        popularShowsDetails.font = .helveticaNeueMedium(size: 12)
        popularShowsAverage.font = .helveticaNeueBold(size: 10)
        popularShowsImage.makeRoundCorners(byRadius: 8)
    }
    
    func configure(data: PopularResultDTO) {
        popularShowsName.text = data.name
        popularShowsAverage.text = data.voteAverage.description
        popularShowsDetails.text = data.overview
        
        if let path = data.posterPath {
            let url = URL(string: Path.baseImage + path)
            popularShowsImage.kf.setImage(with: url)
        }
        
    }
}
