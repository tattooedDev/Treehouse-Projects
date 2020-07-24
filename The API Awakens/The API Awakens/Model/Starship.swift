//
//  Starship.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import Foundation

struct Starship: URLRequestable {
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let starshipClass: String
    let hyperdriveRating: String
    let url: URL
    
    static let path = "starships"
    static let entityDescription = "Starships"
}
