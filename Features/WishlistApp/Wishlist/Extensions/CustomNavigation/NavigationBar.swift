//
//  NavigationBar.swift
//  Wishlist
//
//  Created by admin on 4/23/24.
//

import SwiftUI
import AssetKit

struct NavigationBar: View {
    
    @EnvironmentObject var vm: WishlistViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Divider()
                HStack {
                    Image(uiImage: Asset.Image.Logo.logoBlack.image)
                        .resizable()
                        .frame(width: 36, height: 36)
                        .padding(.leading, 12)
                    Divider()
                    Spacer()
                    Text("WISHLIST")
                    Spacer()
                    Divider()
                    Button {
                        print("searchButton Tapped")
                    } label: {
                        Image(uiImage: Asset.Image.Home.searchHome.image)
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .padding(.trailing, 7)

                }
                .frame(height: 60)
                Divider()
            }
            Spacer()
        }
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
