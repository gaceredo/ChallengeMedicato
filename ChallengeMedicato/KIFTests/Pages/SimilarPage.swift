//
//  FlowPage.swift
//  KIFTests
//
//  Created by Luis Aceredo on 27/8/21.
//

import Foundation

enum SimilarElement: String {
    case back = "Popular TV Shows"
    case viewDetails = "populate_details"
    case collectionView = "similar_collection"
}

struct SimilarPage {

    let test: BaseUITest

    init(test: BaseUITest) {
        self.test = test
    }

    func back() -> SimilarPage {
        test.tapButton(buttonName: SimilarElement.back.rawValue)
        return SimilarPage(test: test)
    }
    func swipeDetails() -> SimilarPage {
        test.swipeTableView(identifier: SimilarElement.viewDetails.rawValue,
                            size: 50)
       return SimilarPage(test: test)
    }
    
    func swipeCollectionView() -> SimilarPage {
        test.swipeCollectionView(identifier: SimilarElement.collectionView.rawValue)
        return SimilarPage(test: test)
    }
   
}

