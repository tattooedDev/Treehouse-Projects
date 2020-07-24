//
//  Pageable.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import Foundation

protocol Pageable: Codable {
    associatedtype Entity: URLRequestable
    var count: Int { get }
    var next: URL? { get }
    var previous: URL? { get }
    var results: [Entity] { get }
}
