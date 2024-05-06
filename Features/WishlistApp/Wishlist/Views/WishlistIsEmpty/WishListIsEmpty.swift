//
//  WishListIsEmpty.swift
//  Wishlist
//
//  Created by admin on 4/23/24.
//

import SwiftUI
import AssetKit

struct WishListIsEmpty: View {
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Image(uiImage: Asset.Image.Wishlist.folder.image)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .padding(.top, 258)
                        .padding(.leading, 16)
                    Text("YOUR WISHLIST IS EMPTY")
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

struct WishListIsEmpty_Previews: PreviewProvider {
    static var previews: some View {
        WishListIsEmpty()
    }
}
