//
//  OrderedProductsView.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 09/05/24.
//

import SwiftUI
import Core
import AssetKit

struct OrderedProductsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            Text("ORDERED PRODUCTS (3 items)")
                .font(.sabFont(600, size: 19))
                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
            
            OrderedItem(
                image: Asset.Image.BankImage.agrobank.image,
                productName: "T-shirt Basic",
                size: "L",
                color: "Dark Blue",
                quantity: "2",
                price: "320 000 UZS") {
                    print("buy it again")
                }
            OrderedItem(
                image: Asset.Image.BankImage.agrobank.image,
                productName: "T-shirt Basic",
                size: "L",
                color: "Dark Blue",
                quantity: "2",
                price: "320 000 UZS") {
                    print("buy it again")
                }
            OrderedItem(
                image: Asset.Image.BankImage.agrobank.image,
                productName: "T-shirt Basic",
                size: "L",
                color: "Dark Blue",
                quantity: "2",
                price: "320 000 UZS") {
                    print("buy it again")
                }
        }
    }
}

#Preview {
    OrderedProductsView()
}
