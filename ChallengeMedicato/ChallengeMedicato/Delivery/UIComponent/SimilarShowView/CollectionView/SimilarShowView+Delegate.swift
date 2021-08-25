//
//  SimilarShowView+Delegate.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import UIKit

extension SimilarShowView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let index = elementSimilar[indexPath.row]
        let cell: SimilarShowCollectionViewCell = collectionView.dequeueReusableaCell(forIndexPath: indexPath)
        cell.configure(data: index)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return elementSimilar.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let index = elementSimilar[indexPath.row]
        delegate?.didSelectItemAt(data: index)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if elementSimilar.count == self.indexPath + 1 {
             delegate?.loadNextPage()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        for cell in collectionView.visibleCells {
            if let indexPath = collectionView.indexPath(for: cell) {
                self.indexPath = indexPath.row
            }
        }
    }

}

extension SimilarShowView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cell: SimilarShowCollectionViewCell = collectionView.dequeueReusableaCell(forIndexPath: indexPath)
        let index = elementSimilar[indexPath.row]
        cell.configure(data: index)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        let size: CGSize = cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
        return CGSize(width: size.width, height: 200)
    }
}
