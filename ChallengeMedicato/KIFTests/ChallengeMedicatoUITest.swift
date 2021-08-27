//
//  ChallengeMedicatoUITest.swift
//  KIFTests
//
//  Created by Luis Aceredo on 27/8/21.
//

import XCTest
import KIF
@testable import ChallengeMedicato

class ChallengeMedicatoUITest: BaseUITest {
    
    func testFlowApp() {
        _ = PopulatePage(test: self)
            .swipeTableView()
            .showDetails()
            .swipeDetails()
            .swipeCollectionView()
            .back()
    }
}
