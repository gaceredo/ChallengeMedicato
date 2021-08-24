//
//  ResponseError.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 24/8/21.
//

import Foundation

public enum ResponseError: Error {
    case ok

    case badRequest
    case unauthorized
    case forbidden
    case notFound

    case internalServerError
    case notImplemented
    case badGateway
    case servicesUnavailable

    case genericError
}
