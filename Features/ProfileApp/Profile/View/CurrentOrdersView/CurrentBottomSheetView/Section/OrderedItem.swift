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
    
    @State var image: UIImage
    @State var productName: String
    @State var size: String
    @State var color: String
    @State var quantity: String
    @State var price: String
    @State var buttonPressed: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 10) {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 124, height: 155)
                VStack(alignment: .leading,spacing: 10) {
                    Text(productName)
                        .font(.sabFont(400, size: 13))
                        .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                    HStack(spacing: 10) {
                        VStack(alignment: .leading,spacing: 4) {
                            Text("Size:")
                                .font(.sabFont(400, size: 9))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                            Text(size)
                                .font(.sabFont(400, size: 11))
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                        VStack(alignment: .leading,spacing: 4) {
                            Text("Color:")
                                .font(.sabFont(400, size: 9))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                            Text(color)
                                .font(.sabFont(400, size: 11))
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                    }
                    HStack(spacing: 10) {
                        VStack(alignment: .leading,spacing: 4) {
                            Text("Quantity:")
                                .font(.sabFont(400, size: 9))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                            Text(quantity)
                                .font(.sabFont(400, size: 11))
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                        VStack(alignment: .leading,spacing: 4) {
                            Text("Price")
                                .font(.sabFont(400, size: 9))
                                .foregroundColor(Asset.Color.Text.secondaryCol.swiftUIColor)
                            Text(price)
                                .font(.sabFont(400, size: 11))
                                .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        }
                    }
                    
                    Button(action: {
                        buttonPressed()
                    }) {
                        Text("BUY IT AGAIN")
                            .font(.sabFont(400, size: 13))
                            .foregroundColor(Asset.Color.Text.primaryCol.swiftUIColor)
                        Image(uiImage: Asset.Image.Icons.repeat04.image)
                            .resizable()
                            .setSize(18)
                    }
                    .frame(height: 40)
                    .background(Asset.Color.Button.grayCol.swiftUIColor)
                    .clipShape(.capsule)
                    .padding()
                }.padding()
            }
        }
    }
}


