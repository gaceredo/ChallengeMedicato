//
//  RequestErrorDTO.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//

import Foundation

struct RequestError: Decodable {
     var statusMessage: String
     var success: Bool?
     var statusCode: Int
    
    private enum CodingKeys: String, CodingKey {
        case statusMessage = "status_message"
        case success
        case statusCode = "status_code"
    }
}
