//
//  AppEnvironment.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//

import Foundation

enum AppEnvironment {
    case Development
    case Release
}

struct AppConfig {
    static var environment : AppEnvironment {
        #if DEBUG
          return .Development
        #else
          return .Release
        #endif
    }
    
}
