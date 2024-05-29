//
//  TrendingModel.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import Foundation
import SwiftUI

struct WelcomeElement: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias Welcome = [WelcomeElement]

class TrendingViewModel: ObservableObject {
    @Published var trendproducts: [TrendProduct] = []
    
    func fetchProducts() {
        let jsonURL = URL(string: "https://jsonplaceholder.typicode.com/photos")! // Example URL, replace with your actual JSON URL
        
        URLSession.shared.dataTask(with: jsonURL) { data, response, error in
            guard let data = data else {
                print("Error fetching data: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let welcome = try JSONDecoder().decode(Welcome.self, from: data)
                DispatchQueue.main.async {
                    self.trendproducts = welcome.map { welcomeElement in
                        TrendProduct(name: welcomeElement.title,
                                     price: "\(welcomeElement.id)", // Just for demonstration, replace with actual price data
                                     imageURL: URL(string: welcomeElement.thumbnailURL)!)
                    }
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct TrendProduct: Hashable {
    let id = UUID() // Add a unique identifier
    let name: String
    let price: String
    let imageURL: URL
}

