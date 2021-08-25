//
//  SimilarShowView.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import UIKit

protocol SimilarShowViewProtocol: AnyObject {
    func loadNextPage()
    func didSelectItemAt(data: PopularResultDTO)
}

class SimilarShowView: ReusableView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var zeroResult: ZeroResultView!
    
    var indexPath: Int = 0
    var elementSimilar: [PopularResultDTO] = []
    weak var delegate: SimilarShowViewProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }
    
    func configure(data: [PopularResultDTO]) {
        elementSimilar = data
        collectionView.isHidden = data.isEmpty
        zeroResult.isHidden = !data.isEmpty
        collectionView.reloadData()
    }
    
    func setupCollectionView() {
        collectionView.registerNib(SimilarShowCollectionViewCell.self)
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
    }
    
}
