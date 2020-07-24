//
//  URLRequestable.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import Foundation

protocol URLRequestable: Codable {
    var name: String { get }
    var url: URL { get }
    static var path: String { get }
    static var entityDescription: String { get }
}
