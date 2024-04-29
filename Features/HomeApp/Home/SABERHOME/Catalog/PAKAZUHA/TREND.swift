//
//  TREND.swift
//  SABERHOME
//
//  Created by islombek on 22/04/24.
//

import SwiftUI

struct NewCollectionView22: View {
 
    @EnvironmentObject var viewModel22 : NewCollectionController22
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("NEW COLLECTION")
                    .font(.system(size: 19, weight: .bold))
                    .foregroundColor(Color.black)
                    .padding(.leading, -10)
                
                Spacer()
                
                Text("SEE ALL")
                    .font(.system(size: 13))
                    .fontWeight(.thin)
                    .foregroundColor(Color.gray)
            }
            .padding()
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(0..<viewModel22.newCollectionProducts22.count, id: \.self) { index in
                        ProductItemView22(product22: $viewModel22.newCollectionProducts22[index])
                        
                    }
                }
                .padding(.horizontal, 0)
            }
            .padding(.top, -10)
        }
    }
}


















import SwiftUI

struct Product22: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}





enum PRODUCT22: String, Codable {
    case elementum = "elementum"
    case ipsum = "ipsum"
    case jsonplaceholder = "jsonplaceholder"
    case lorem = "lorem"
    case rutrum = "rutrum"
}

enum Status22: String, Codable {
    case published = "published"
}

typealias PROODUCT22 = [Product22]



import Foundation
import Combine

class NewCollectionController22: ObservableObject {
    
    @Published var newCollectionProducts22: [Product22] = []
    
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
        
            .decode(type: [Product22].self, decoder: JSONDecoder())
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
                self?.newCollectionProducts22 = model
            }.store(in: &cancelable)
    }

    
        
        
        
   
    
}












import SwiftUI

struct ProductItemView22: View {
   @Binding var product22: Product22
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product22.thumbnailURL )) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                   
                    .padding(.horizontal, 2)
                    .padding(.top, 10)
            } placeholder: {
                ProgressView()
                    .padding()
            }
            .frame(width: 301, height: 376)
            
            Text(product22.title)
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.leading, 0)
                .padding(.top, 80)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
            
            Text(product22.id.description )
                .font(.system(size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.black)
                .padding(.leading, 0)
                .padding(.top, 2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
            
            Button(action: {
               
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

