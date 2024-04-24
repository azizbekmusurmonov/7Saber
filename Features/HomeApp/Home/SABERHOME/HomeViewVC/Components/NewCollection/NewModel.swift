//
//  NewModel.swift
//  SABERHOME
//
//  Created by islombek on 17/04/24.
//

import SwiftUI

struct Product: Codable {
    let id: Int
    let slug: String
    let url: String
    let title, content: String
    let image, thumbnail: String
    let status: Status
    let category: PRODUCT
    let publishedAt, updatedAt: String
    let userID: Int
    
    enum CodingKeys: String, CodingKey {
        case id, slug, url, title, content, image, thumbnail, status, category, publishedAt, updatedAt
        case userID = "userId"
    }

}




enum PRODUCT: String, Codable {
    case elementum = "elementum"
    case ipsum = "ipsum"
    case jsonplaceholder = "jsonplaceholder"
    case lorem = "lorem"
    case rutrum = "rutrum"
}

enum Status: String, Codable {
    case published = "published"
}

typealias PROODUCT = [Product]



import Foundation
import Combine

class NewCollectionController: ObservableObject {
    
    @Published var newCollectionProducts: [Product] = []
    
    var cancelable = Set<AnyCancellable>()
    
    init() {
        fetchProducts()
    }
    
    func fetchProducts() {
        
        let urlString = "https://jsonplaceholder.org/posts"
        guard let url = URL(string: urlString) else { print("url not found"); return }
        
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode < 300
                else { return .init() }
                
                return data
            }
        
            .decode(type: [Product].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { completion in
                switch completion {
                case .finished:
                    print("))))))))))))))))))))))))")
                    break
                case .failure(let error):
                    print("XXXXXXXXXXXXX")
                }
            } receiveValue: { [weak self] model in
                self?.newCollectionProducts = model
            }.store(in: &cancelable)
    }

    
        
        
        
   
    
}
