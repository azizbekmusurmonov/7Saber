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
    
    @EnvironmentObject public var vm: WishlistDetailVM
    
    @State var selectedColorIndex: Int = .zero
    
    public var body: some View {
        VStack(spacing: .zero) {
            BottomSheetsNavBar(title: "SELECT SIZE")
            
            
            DetailInfoView(imageURL: "", title: "T-shirt Basic", price: "375 000 UZS")
            
            ImageColorView(colors: [.red, .green, .blue, .yellow, .purple, .black, .gray], colorIndex: $selectedColorIndex)
            
            
        }
    }
}
