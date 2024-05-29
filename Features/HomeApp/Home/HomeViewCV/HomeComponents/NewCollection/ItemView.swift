//
//  ItemView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI

public struct ProductItemView: View {
    let product: ProductModel
    
    public var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: product.bg.src)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .padding(.horizontal, 0)
                    .padding(.top, 0)
                    .onAppear {
                        print("product.bg.src", product.bg.src)
                    }
            } placeholder: {
                ProgressView()
            }.onAppear {
                print("product.bg.src", product.bg.src)
            }
          .frame(width: 301, height: 400)
            
            
            Text(product.nameRu)
                .font(.system(size: 13))
                .fontWeight(.medium)
                .foregroundColor(.black)
                .padding(.leading, 0)
                .padding(.top, 0)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(2)
            
            Text(product.bg.id.description)
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
