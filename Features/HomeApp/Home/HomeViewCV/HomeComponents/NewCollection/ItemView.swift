//
//  ItemView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI
import AssetKit

public struct ProductItemView: View {
    let product: ProductModel
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: product.bg.src)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 301, height: 376)
                        .clipped()
                } placeholder: {
                    ProgressView()
                }
                
                Button(action: {
                    // Button action
                }) {
                    Image(uiImage: Asset.Image.Icons.plusCircle.image)
                        .resizable()
                        .frame(width: 48, height: 48)
                }
                .padding(10)
            }
            
            Text(product.nameRu)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.black)
                .padding(.top, 8)
                .padding(.leading, 10)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(product.bg.type.description)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.black)
                .padding(.top, 2)
                .padding(.leading, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .lineLimit(1)
            
            Spacer()
        }
        //.frame(width: 301, height: 376)
    }
}

