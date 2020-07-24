//
//  Networker.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import Foundation
import Combine

final class Networker<Entity: URLRequestable> {
    private init() {}
    
    static func request(urlRequest: URLRequest) -> AnyPublisher<PagedResponse<Entity>, Error> {
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .map(\.data)
            .decode(type: PagedResponse.self, decoder: JSONDecoder.starWarsDecoder)
            .eraseToAnyPublisher()
    }
    
    static func request(url: URL) -> AnyPublisher<PagedResponse<Entity>, Error> {
        request(urlRequest: URLRequest(url: url))
    }
}
