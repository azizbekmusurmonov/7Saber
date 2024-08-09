//
//  OrderedItem.swift
//  Profile
//
//  Created by Azizbek Musurmonov   on 09/05/24.
//

import SwiftUI
import Core
import AssetKit

struct OrderedItem: View {
    
    @EnvironmentObject var vm: OrdersViewModel
    
    @State var product: Products
    @State var buttonPressed: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Image(uiImage: product.image)
                    .resizable()
                    .frame(width: 124, height: 155)
                VStack(alignment: .leading,spacing: 10) {
                    Text(product.productName)
                        .font(.sabFont(400, size: 13))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    HStack(spacing: 10) {
                        VStack(alignment: .leading,spacing: 4) {
                            Text("\(Localizations.size) :")
                                .font(.sabFont(400, size: 9))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                            Text(product.size)
                                .font(.sabFont(400, size: 11))
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                        VStack(alignment: .leading,spacing: 4) {
                            Text("\(Localizations.color) :")
                                .font(.sabFont(400, size: 9))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                            Text(product.color)
                                .font(.sabFont(400, size: 11))
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                    }
                    HStack(spacing: 10) {
                        VStack(alignment: .leading,spacing: 4) {
                            Text("\(Localizations.quantity) :")
                                .font(.sabFont(400, size: 9))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                            Text(product.quantity)
                                .font(.sabFont(400, size: 11))
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                        VStack(alignment: .leading,spacing: 4) {
                            Text("Price")
                                .font(.sabFont(400, size: 9))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                            Text(product.price)
                                .font(.sabFont(400, size: 11))
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                    }
                    
                    Button(action: {
                        buttonPressed()
                    }) {
                        Text(Localizations.buyItAgain)
                            .font(.sabFont(400, size: 13))
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        Image(uiImage: Asset.Image.Icons.repeat04.image)
                            .resizable()
                            .setSize(18)
                    }
                    .padding()
                    .frame(height: 40)
                    .background(Asset.Color.Button.grayCol.swiftUIColor)
                    .clipShape(.capsule)
                    
                }.padding()
            }
        }
    }
}


