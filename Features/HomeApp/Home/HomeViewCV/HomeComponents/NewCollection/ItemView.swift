//
//  ItemView.swift
//  Home
//
//  Created by islombek on 22/05/24.
//

import SwiftUI
import AssetKit

public struct ProductItemView: View {
    let product: NewCollectionDatum
    let productimage: NewCollectionMainImg
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            productImageView
            productInfoView
            Spacer()
        }
        .frame(width: 393, height: 478)
    }
    
    // MARK: - Subviews
    
    private var productImageView: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: productimage.src)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 301, height: 376)
                    .clipped()
            } placeholder: {
                ProgressView()
            }
            
            addToCartButton
                .padding(10)
        }
    }
    
    private var addToCartButton: some View {
        Button(action: {
            // Add to cart action here
        }) {
            Circle()
                .fill(Color.white)
                .frame(width: 48, height: 48)
                .shadow(radius: 2)
                .overlay(
                    Image(uiImage: Asset.Image.Home.plusHome.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.black)
                )
        }
    }

    
    private var productInfoView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(product.nameEn)
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(.black)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 8)
            
            if let price = product.price["uzs"] ?? product.price.values.compactMap({ $0 }).first {
                Text("\(price) so'm")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding([.leading, .top], 0)
    }
}

