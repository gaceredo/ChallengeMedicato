//
//  MethodRequestProtocol.swift
//  ChallengeMedicatoTests
//
//  Created by Luis Aceredo on 26/8/21.
//

import Foundation
import Combine
@testable import ChallengeMedicato


class RequestProtocolMock : RequestProtocol {
    
    var session: URLSession
    var error: ResponseHandlingError
    
    var name: String = ""
    var statusCode: Int = 0
    
    init(configuration: URLSessionConfiguration,
         error: ResponseHandlingError = ResponseHandlingError()) {
        self.session = URLSession(configuration: configuration)
        self.error = error
    }
    
    func execute<T>(_ request: URLRequest,
                    decodingType: T.Type,
                    queue: DispatchQueue,
                    retries: Int) -> AnyPublisher<T, Error> where T : Decodable {
        
        return session.dataTaskPublisher(for: request)
            .tryMap { (_, _) in
                
                let data = String.json(fromFile: self.name, bundle: BundleTest.bundleTest)
                
                guard self.statusCode == 200 else {
                    let decode = try? JSONDecoder().decode(RequestError.self, from: data)
                    throw self.error.handlingError(statusCode: decode?.statusCode ?? .zero)
                }
                return data
            }
            
            .decode(type: T.self, decoder: JSONDecoder())
            .receive(on: queue)
            .retry(retries)
            .eraseToAnyPublisher()
    }
    
}
