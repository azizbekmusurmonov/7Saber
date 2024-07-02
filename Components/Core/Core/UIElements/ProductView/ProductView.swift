//
//  ProductView.swift
//  Core
//
//  Created by Ismatillokhon on 01/07/24.
//

import SwiftUI
import AssetKit

public struct Product: Identifiable {
    public var id: Int
    public let imageURL: String
    public let title: String
    public let priceWithCurrency: String
    public let size: String
    public let color: String
    public let quantity: Int
    public let discountDisplay: String?
    
    public init(id: Int, imageURL: String, title: String, priceWithCurrency: String, size: String, color: String, quantity: Int, discountDisplay: String? = nil) {
        self.id = id
        self.imageURL = imageURL
        self.title = title
        self.priceWithCurrency = priceWithCurrency
        self.size = size
        self.color = color
        self.quantity = quantity
        self.discountDisplay = discountDisplay
    }
}

public struct ProductView: View {
    
    private let product: Product
    
    public init(product: Product) {
        self.product = product
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 10.dpHeight()) {
            HStack(alignment: .top, spacing: 10.dpWidth()) {
                image
                
                VStack(alignment: .leading, spacing: 16.dpWidth()) {
                    titlePriceView
                    sizeColorQuantityView
                }
                Spacer()
            }
            Divider()
        }
        .padding(.horizontal, 16.dpHeight())
    }
    
    var image: some View {
        AsyncImage(url: .init(string: product.imageURL)) { image in
            image
                .resizable()
                .frame(width: 124.dpWidth(), height: 155.dpHeight())
        } placeholder: {
            ProgressView()
                .frame(width: 124.dpWidth(), height: 155.dpHeight())
        }
    }
    
    var titlePriceView: some View {
        VStack(alignment: .leading, spacing: 4.dpWidth()) {
            Text(product.title)
                .font(.sabFont(400, size: 13))
            
            Text(product.priceWithCurrency)
                .font(.sabFont(500, size: 16))
            
        }
    }
    
    var sizeColorQuantityView: some View {
        HStack(spacing: 30.dpWidth()) {
            titleDescription(title: Localizations.size + ":", description: product.size)
            titleDescription(title: Localizations.color, description: product.color)
            titleDescription(title: Localizations.quantity, description: product.quantity.description)
        }
    }
    
    func titleDescription(title: String, description: String) -> some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.sabFont(400, size: 11))
                .tint(Asset.Color.Text.secondaryCol.swiftUIColor)
            
            Text(description)
                .font(.sabFont(400, size: 13))
        }
    }
}
