//
//  AppEnvironment.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//

import Foundation


enum AppEnvironment: String {

    case Debug
    case Release

    static let current: AppEnvironment = {
        guard let rawValue = Bundle.main.infoDictionary?["Configuration"] as? String else {
            fatalError("No Configuration Found")
        }

        guard let configuration = AppEnvironment(rawValue: rawValue) else {
            fatalError("Invalid Configuration")
        }

        return configuration
    }()

    static var baseURL: String {
        switch current {
        case .Debug, .Release: return "https://api.themoviedb.org"
        }
    }

}
