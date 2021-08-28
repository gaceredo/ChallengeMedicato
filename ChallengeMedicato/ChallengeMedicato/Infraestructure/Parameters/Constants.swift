//
//  Constants.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//

import Foundation


enum Constants {
    static var apiKey: String {
        switch AppEnvironment.current {
        case .Debug,
             .Release:  return "dfb620b5f8bb704f5cb2b40ea5209237"
        }
    }
}

enum Keys {
    static let page: String = "page"
    static let apiKey: String = "api_key"
}

enum Path {
    static var baseImage: String {
        switch AppEnvironment.current {
        case .Debug,
             .Release:  return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
