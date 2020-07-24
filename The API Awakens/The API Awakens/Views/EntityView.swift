//
//  EntityView.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import SwiftUI

struct EntityView<Entity: URLRequestable>: View {
    @ObservedObject var controller = EntityController<Entity>()
    
    var body: some View {
        List(controller.entities, id: \.name) { entity in
            NavigationLink(destination: EntityDetailView(entity: entity)) {
                Text(entity.name)
            }
        }
        .navigationBarTitle(Text(Entity.entityDescription))
        .alert(isPresented: .constant(controller.error != nil)) {
            Alert(title: Text("Error"), message: Text(controller.error!.localizedDescription), dismissButton: .default(Text("OK")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EntityView<Person>()
    }
}
