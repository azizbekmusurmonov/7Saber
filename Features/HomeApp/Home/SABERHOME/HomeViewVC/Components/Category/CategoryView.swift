//
//  File.swift
//  SABERHOME
//
//  Created by islombek on 15/04/24.
//

import SwiftUI

struct CategoryView: View {
    let categories: [Category]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("CATEGORIES")
                .font(.system(size: 19, weight: .bold))
                .foregroundColor(Color.black)
                .padding(.leading, 0)
                .padding(.top, 10)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 2) {
                    ForEach(categories, id: \.name) { category in
                        CategoryItemView(category: category)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.vertical, 10)
    }
}



















struct Category {
    let name: String
    let imageURL: URL
    let price: String
}



struct CategoryItemView: View {
    let category: Category
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: category.imageURL) { image in
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
            
            Text(category.name)
                .font(.system(size: 25))
                .fontWeight(.light)
                .lineLimit(1)
                .foregroundColor(.black)
                .padding(.top, -30)
            
            Text(category.price)
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .padding(.top, -10)
        }
    }
}
