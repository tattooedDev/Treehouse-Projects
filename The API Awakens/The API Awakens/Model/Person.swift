//
//  Person.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import Foundation

struct Person: URLRequestable {
    let name: String
    let height: String
    let mass: String
    let skinColor: String
    let birthYear: String
    let gender: String
    let url: URL
    
    static let path = "people"
    static let entityDescription = "People"
}
