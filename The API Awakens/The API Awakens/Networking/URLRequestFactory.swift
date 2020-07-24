//
//  URLRequestFactory.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import Foundation

struct URLRequestFactory {
    private static var baseURL: URL? { URL(string: "https://swapi.dev/api") }
    
    private init() {}
    
    static func entityRequest<Entity: URLRequestable>(_ entity: Entity.Type, page: Int) -> URLRequest? {
        guard let baseURL = baseURL else { return nil }
        
        var components = URLComponents(url: baseURL.appendingPathComponent(Entity.path), resolvingAgainstBaseURL: false)
        components?.queryItems = [URLQueryItem(name: "page", value: "\(page)")]
        
        guard let url = components?.url else { return nil }
        
        return URLRequest(url: url)
    }
}
