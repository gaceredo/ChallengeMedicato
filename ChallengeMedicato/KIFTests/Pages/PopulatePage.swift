//
//  HomePage.swift
//  KIFTests
//
//  Created by Luis Aceredo on 27/8/21.
//

import Foundation

enum PopulatePageElement: String {
    case tableViewId = "popular_tableView"
}

struct PopulatePage {
    let test: BaseUITest
       
    init(test: BaseUITest) {
         self.test = test
    }
    func swipeTableView() -> PopulatePage {
        test.swipeTableView(identifier: PopulatePageElement.tableViewId.rawValue, size: 80)
        return PopulatePage(test: test)
    }
    
    func showDetails() -> SimilarPage {
        test.tapRow(identifier: PopulatePageElement.tableViewId.rawValue)
        return SimilarPage(test: test)
    }
    
}

