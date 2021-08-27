//
//  BaseUITest.swift
//  KIFTests
//
//  Created by Luis Aceredo on 27/8/21.
//

import XCTest

class BaseUITest : XCTestCase {
    
    let indexMock = IndexPath(row: 3, section: 0)
    
    func tapButton(buttonName: String) {
        tester().tapView(withAccessibilityLabel: buttonName)
    }
    
    func waitElementVisible(elementName: String){
        tester().waitForView(withAccessibilityLabel: elementName)
    }
    
    func swipeTableView(identifier: String,
                        size vertical: CGFloat = UIScreen.main.bounds.height) {
        tester().scrollView(withAccessibilityIdentifier: identifier, byFractionOfSizeHorizontal: 0, vertical: vertical)
    }
    func tapRow(identifier: String) {
        tester().tapRow(at: indexMock,
                        inTableViewWithAccessibilityIdentifier: identifier)
    }
    
    func swipeCollectionView(identifier: String,
                             size horizontal: CGFloat = UIScreen.main.bounds.height) {
        tester().scrollView(withAccessibilityIdentifier: identifier, byFractionOfSizeHorizontal: horizontal, vertical: 0)
    }
}
