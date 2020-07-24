//
//  SelectEntityView.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import SwiftUI

struct SelectEntityView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    NavigationLink(destination: EntityView<Person>()) {
                        Image(name: .characters)
                            .renderingMode(.original)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: EntityView<Starship>()) {
                        Image(name: .starships)
                            .renderingMode(.original)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: EntityView<Vehicle>()) {
                        Image(name: .vehicles)
                            .renderingMode(.original)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct SelectEntityView_Previews: PreviewProvider {
    static var previews: some View {
        SelectEntityView()
    }
}
