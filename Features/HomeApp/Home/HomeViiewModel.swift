//
//  HomeViiewModel.swift
//  Home
//
//  Created by Ismatillokhon on 3/26/24.
//

import SwiftUI
import Combine
import NetworkManager

final public class HomeViiewModel: ObservableObject {
    
    @Published var posts: [Post] = []
    @Published var showLoading = true
    @Published var tfString = ""
    var cancelable = Set<AnyCancellable>()
    
    public init() {
        fetchPosts()
    }
    
    
    func fetchPosts() {
        let urlString: String = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) in
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return .init() }
                
                return data
            }.decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: RunLoop.main)
            .sink { result in
                switch result {
                case .finished:
                    break
                case .failure(let err):
                    print(err)
                }
            } receiveValue: { model in
                self.posts = model
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.showLoading = false
                }
            }.store(in: &cancelable)

    }
    
    func fetchBoshqa() {
        
    }
}


struct Post: Codable {
    var userID, id: Int
    var title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

