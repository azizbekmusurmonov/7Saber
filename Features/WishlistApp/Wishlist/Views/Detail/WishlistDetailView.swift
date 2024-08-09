//
//  WishlistDetailView.swift
//  Wishlist
//
//  Created by Ismatillokhon on 5/6/24.
//

import SwiftUI
import Core
import AssetKit

public struct WishlistDetailView: View {
    
    @EnvironmentObject public var vm: WishlistViewModel
    
    @State var selectedColorIndex: Int = .zero
    
    let item: GetWishlistModel
    
    public var body: some View {
        VStack(alignment: .leading, spacing: .zero) {
            BottomSheetsNavBar(title: "SELECT SIZE")
            DetailInfoView(item: item)
                .padding(.top, 10)
            
            VStack {
                
                HStack {
                    Text("Color")
                        .font(.system(size: 15))
                        .padding(.top, 10)
                    Spacer()
                }
                ColorPickView()
            }.padding(.leading, 16)
            Divider()
            
            VStack {
                
                HStack {
                    Text("Size")
                        .font(.system(size: 15))
                        .padding(.top, 10)
                    Spacer()
                }.padding(.leading, 16)
                SizePickerView()
            }
            VStack {
                ButtonPick(title: "ADD TO CARD", icon: Asset.Image.TabBars.cart.image, buttonPressed: {
                    
                })
            }.padding(.leading, 25)
            
        }
    }
}
