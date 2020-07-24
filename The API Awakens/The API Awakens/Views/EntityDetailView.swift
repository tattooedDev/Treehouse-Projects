//
//  EntityDetailView.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import SwiftUI

struct EntityDetailView: View {
    var entity: URLRequestable
    
    var body: some View {
        VStack {
            if entity is Person {
                PersonDetailView(person: entity as! Person)
            } else if entity is Starship {
                StarshipDetailView(starship: entity as! Starship)
            } else {
                VehicleDetailView(vehicle: entity as! Vehicle)
            }
        }
        .navigationBarTitle(entity.name)
        .onAppear {
            UITableView.appearance().tableFooterView = UIView()
        }
    }
}

struct PersonDetailView: View {
    var person: Person
    
    var body: some View {
        List {
            EntityDetailRow(title: "Name:", attributeDetail: person.name)
            
            EntityDetailRow(title: "Height:", attributeDetail: person.height)
            
            EntityDetailRow(title: "Gender:", attributeDetail: person.gender)

            EntityDetailRow(title: "Birthyear:", attributeDetail: person.birthYear)
        }
    }
}

struct StarshipDetailView: View {
    var starship: Starship
    
    var body: some View {
        List {
            EntityDetailRow(title: "Name:", attributeDetail: starship.name)
            
            EntityDetailRow(title: "Model:", attributeDetail: starship.model)

            EntityDetailRow(title: "Manufacturer:", attributeDetail: starship.manufacturer)

            EntityDetailRow(title: "Cost in Credits:", attributeDetail: starship.costInCredits)

            EntityDetailRow(title: "Length:", attributeDetail: starship.length)

            EntityDetailRow(title: "Starship Class:", attributeDetail: starship.starshipClass)
        }
    }
}

struct VehicleDetailView: View {
    var vehicle: Vehicle
    
    var body: some View {
        List {
            EntityDetailRow(title: "Name:", attributeDetail: vehicle.name)
            
            EntityDetailRow(title: "Model:", attributeDetail: vehicle.model)
            
            EntityDetailRow(title: "Manufacturer:", attributeDetail: vehicle.manufacturer)
            
            EntityDetailRow(title: "Cost in Credits", attributeDetail: vehicle.costInCredits)
            
            EntityDetailRow(title: "Length:", attributeDetail: vehicle.length)
            
            EntityDetailRow(title: "Vehicle Class:", attributeDetail: vehicle.vehicleClass)
        }
    }
}

struct EntityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EntityDetailView(entity: Person(name: "test", height: "167", mass: "167", skinColor: "white", birthYear: "2000", gender: "male", url: URL(string: "https://apple.com")!))
    }
}
