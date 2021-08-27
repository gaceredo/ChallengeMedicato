//
//  CreatePopularShow.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import Foundation
@testable import ChallengeMedicato

class CreatePopularShow {
    static var elements: PopularDTO {
        let data = String.json(fromFile: "popularShows", bundle: BundleTest.bundleTest)
        let decoder = JSONDecoder()
        let decodable  = try! decoder.decode(PopularDTO.self, from: data)
        return decodable
    }
}

extension String {
    static func json(fromFile: String, bundle: Bundle) -> Data {
        let data = Data(jsonFileName: fromFile, bundle: bundle)
        return data
    }
}

extension Data {
    init(jsonFileName: String, bundle: Bundle = Bundle.main) {
        do {
            if let file = bundle.url(forResource: jsonFileName, withExtension: "json") {
                try self.init(contentsOf: file)
                return
            }
        } catch {
            print(error.localizedDescription)
        }
        self.init()
    }
}
