//
//  CategoryView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

import SwiftUI

struct CategoryView: View {
    @ObservedObject var viewModel: CategoryViewModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("CATEGORIES")
                .font(.system(size: 19, weight: .bold))
                .foregroundColor(Color.black)
                .padding(.leading, 0)
                .padding(.top, 10)
                .padding(.horizontal)
            
            if viewModel.isLoading {
                ProgressView("Loading...")
                    .padding(.top, 10)
            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
                    .padding(.top, 10)
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 2) {
                        ForEach(viewModel.categories) { category in
                            CategoryItemView(category: category)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .padding(.vertical, 10)
        .onAppear {
            viewModel.fetchCategories()
        }
    }
}




















struct Category: Equatable {
    let name: String
    let imageURL: URL
    let price: String
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.name == rhs.name && lhs.imageURL == rhs.imageURL && lhs.price == rhs.price
    }
}



import SwiftUI

struct CategoryItemView: View {
    let category: CategoryElement
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: category.bg.src)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            } placeholder: {
                ProgressView()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(category.nameEn)
                .font(.system(size: 25))
                .fontWeight(.light)
                .lineLimit(1)
                .foregroundColor(.black)
                .padding(.top, -30)
        }
    }
}
