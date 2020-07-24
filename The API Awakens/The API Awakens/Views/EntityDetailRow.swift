//
//  EntityDetailRow.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import SwiftUI

struct EntityDetailRow: View {
    var title: String
    var attributeDetail: String
    
    var body: some View {
        HStack {
            Text(title)
                .multilineTextAlignment(.leading)
            
            Spacer()
            
            Text(attributeDetail)
                .multilineTextAlignment(.trailing)
        }
        .padding()
    }
}

struct PersonDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        EntityDetailRow(title: "Name:", attributeDetail: "Steve")
    }
}
