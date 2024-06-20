//
//  NavigationBar.swift
//  CartApp
//
//  Created by Asadbek Yoldoshev on 09/06/24.
//

import SwiftUI
import AssetKit

struct NavigationBar: View {
    
    @EnvironmentObject var vm: CartViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Divider()
                HStack {
                    Image(uiImage: Asset.Image.Logo.logoBlack.image)
                        .resizable()
                        .frame(width: 36, height: 36)
                        .padding(.leading, 12)
                        .padding(.trailing, 12)
                    Divider()
                    Spacer()
                    Text("CART")
                    Spacer()
                    Divider()
                    Button {
                        print("searchButton Tapped")
                    } label: {
                        Image(uiImage: Asset.Image.Home.searchHome.image)
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    .padding(.trailing, 17)
                    .padding(.leading, 17)
                    
                }
                .frame(height: 60)
                Divider()
            }
            Spacer()
        }
    }
}

#Preview {
    NavigationBar()
}

