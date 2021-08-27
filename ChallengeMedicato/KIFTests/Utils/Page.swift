//
//  Page.swift
//  KIFTests
//
//  Created by Luis Aceredo on 27/8/21.
//

import Foundation

protocol Page {
    var test: BaseUITest! {get set}
    var pageIdentifier: String {get}
    
    init()
    init(test: BaseUITest)
}
