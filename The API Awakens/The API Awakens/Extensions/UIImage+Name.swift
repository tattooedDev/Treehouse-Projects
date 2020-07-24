//
//  UIImage+Name.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import SwiftUI

extension Image {
    struct Name: RawRepresentable {
        typealias RawValue = String
        
        let rawValue: RawValue
        var name: String { return rawValue }
        
        init?(rawValue: RawValue) {
            self.rawValue = rawValue
        }
        
        init(name: String) {
            self.rawValue = name
        }
    }
    
    init(name: Name) {
        self.init(name.name)
    }
}

extension Image.Name {
    static let characters = Image.Name(name: "icon-characters")
    static let starships = Image.Name(name: "icon-starships")
    static let vehicles = Image.Name(name: "icon-vehicles")
}
