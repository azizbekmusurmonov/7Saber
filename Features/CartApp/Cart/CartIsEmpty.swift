//
//  CartIsEmpty.swift
//  Cart
//
//  Created by Asadbek Yoldoshev on 10/06/24.
//

import SwiftUI
import AssetKit

struct CartIsEmpty: View {
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Image(uiImage: Asset.Image.Wishlist.folder.image)
                        .resizable()
                        .frame(width: 32, height: 32)
//                        .padding(.top, 258)
                        .padding(.leading, 16)
                    Text("YOUR CART IS EMPTY")
                        .padding(.leading, 16)
                        .padding(.top, 8)
                        .font(.system(size: 16))
                    Text("Seems you have not added \nany product here.")
                        .padding(.leading, 16)
                        .padding(.top, 2)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    CartIsEmpty()
}

