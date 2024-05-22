//
//  Trend.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI
import Combine

public struct ProductItemView22: View {
    public let product22: Product22
    
    public var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product22.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.horizontal, 2)
                    .padding(.top, 10)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 301, height: 400)
            
            Text(product22.title)
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.leading, 0)
                .padding(.top, 0)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
            
            Text(product22.id.description)
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.leading, 0)
                .padding(.top, 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
            
            Button(action: {
                // Handle button action here
            }) {
                Image("plusonImage")
                    .frame(width: 48, height: 48)
                    .padding(.top, -120)
                    .padding(.leading, 0)
                    .padding(0)
            }
            .padding(.leading, 10)
        }
    }
}

public struct NewCollectionView22: View {
    @ObservedObject var viewModel22 = NewCollectionViewModel22()
    
    public var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("TRENDING NOW")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(.black)
                    .padding(.leading, -20)
                
                Spacer()
                
                Button(action: {
                    viewModel22.fetchProducts()
                }) {
                    if viewModel22.isLoading {
                        ProgressView()
                     } else {
                        Text("SEE ALL")
                            .font(.system(size: 13))
                            .fontWeight(.thin)
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            
            if let error = viewModel22.error {
                Text("Error: \(error.localizedDescription)")
                    .foregroundColor(.red)
                    .padding()
            } else {
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        ForEach(viewModel22.newCollectionProducts22) { product in
                            ProductItemView22(product22: product)
                        }
                    }
                    .padding(.horizontal, 0)
                }
                .padding(.top, -10)
            }
        }
        .onAppear {
            viewModel22.fetchProducts()
        }
    }
}

public struct Product22: Codable, Identifiable {
    public let id: Int
    let slug: String
    let url: String
    let title, content: String
    let image, thumbnail: String
    let status: Status22
    let category: ProductModel22
    let publishedAt, updatedAt: String
    let userID: Int
    
    
    enum CodingKeys: String, CodingKey {
        case id, slug, url, title, content, image, thumbnail, status, category, publishedAt, updatedAt
        case userID = "userId"
    }

}

public enum ProductModel22: String, Codable {
    case elementum = "elementum"
    case ipsum = "ipsum"
    case jsonplaceholder = "jsonplaceholder"
    case lorem = "lorem"
    case rutrum = "rutrum"
}

public enum Status22: String, Codable {
    case published = "published"
}

public class NewCollectionViewModel22: ObservableObject {
    @Published var newCollectionProducts22: [Product22] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchProducts() {
        isLoading = true
        let urlString = "https://jsonplaceholder.org/posts"
        guard let url = URL(string: urlString) else {
            error = URLError(.badURL)
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) in
                guard let response = response as? HTTPURLResponse, response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Product22].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.isLoading = false
                    print("Data fetching completed!")
                case .failure(let error):
                    self?.error = error
                    self?.isLoading = false
                    print("Failed to fetch data: \(error.localizedDescription)")
                }
            }, receiveValue: { [weak self] products in
                self?.newCollectionProducts22 = products
            })
            .store(in: &cancellables)
    }
}
