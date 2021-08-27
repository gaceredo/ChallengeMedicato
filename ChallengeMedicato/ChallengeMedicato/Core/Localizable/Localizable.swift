//
//  Localizable.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import Foundation

enum Localizable {
    
    enum PopularShows: String, LocalizableString {
        var screen: String { "PopularShows" }
        case title
        case tableView
        case details
    }
    enum SimilarShows: String, LocalizableString {
        var screen: String { "SimilarShows" }
        case collectionView
    }
}
