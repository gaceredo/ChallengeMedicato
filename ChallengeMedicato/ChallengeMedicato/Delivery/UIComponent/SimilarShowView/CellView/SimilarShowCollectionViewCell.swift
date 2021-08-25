//
//  SimilarShowCollectionViewCell.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import UIKit

class SimilarShowCollectionViewCell: UICollectionViewCell, ConfigurableCell {

    @IBOutlet weak var similarShowImage: UIImageView!
    @IBOutlet weak var similarShowName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupStyle()
    }
    func setupStyle() {
        similarShowName.font = .helveticaNeueMedium(size: 14)
        similarShowImage.makeRoundCorners(byRadius: 10)
    }
    
    func configure(data: PopularResultDTO) {
        similarShowName.text = data.name
        if let path = data.posterPath {
            let url = URL(string: Path.baseImage + path)
            similarShowImage.kf.setImage(with: url)
        }
    }
    
}
