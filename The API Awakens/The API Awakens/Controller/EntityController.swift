//
//  EntityController.swift
//  The API Awakens
//
//  Created by Dennis Parussini on 06.06.20.
//  Copyright © 2020 Dennis Parussini. All rights reserved.
//

import Foundation
import Combine

final class EntityController<Entity: URLRequestable>: ObservableObject {
    @Published var entities = [Entity]()
    @Published var error: Error?
    
    private var page = 1
    
    private let loadedPagePublisher = PassthroughSubject<PagedResponse<Entity>, Never>()
    let finishedPublisher: AnyPublisher<[Entity], Never>
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.finishedPublisher = loadedPagePublisher
            .reduce([Entity](), { allItems, response in
                return response.results + allItems
            })
            .eraseToAnyPublisher()
        
        initiateLoadSequence()
    }
    
    func initiateLoadSequence() {
        return Networker<Entity>.request(urlRequest: URLRequestFactory.entityRequest(Entity.self, page: page)!)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                if case .failure(let error) = $0 {
                    self.error = error
                }
            }) { response in
                self.entities += response.results
                self.loadedPagePublisher.send(response)
                
                if response.next == nil {
                    self.loadedPagePublisher.send(completion: .finished)
                } else {
                    self.page += 1
                    self.initiateLoadSequence()
                }
        }
        .store(in: &subscriptions)
    }
}
