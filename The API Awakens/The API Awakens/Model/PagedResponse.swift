//
//  PagedResponse.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import Foundation

struct PagedResponse<Entity: URLRequestable>: Pageable {
    let count: Int
    let next: URL?
    let previous: URL?
    let results: [Entity]
}
