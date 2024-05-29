//
//  ContentView.swift
//  7Saber-main
//
//  Created by Ismatillokhon on 3/26/24.
//

import SwiftUI
import Home
import Wishlist
import SwiftUI
import CategoryTarget
import Cart
import Catalog
import Profile
import AssetKit

struct TabBarView: View {
    
   // @StateObject var homeVM = HomeViiewModel()
    @StateObject var wishlistVM = WishlistViewModel()
    @StateObject var catalogVM = CatalogViewModel()
    @StateObject var cartVC = CartViewModel()
    @StateObject var profileVM = ProfileViewModel()
    
    var body: some View {
        ZStack {
            Blur(style: .extraLight)
                .edgesIgnoringSafeArea(.all)
            
            TabView {
                ContentView()
                    .tabItem {
                        Image(uiImage: Asset.Image.TabBars.home.image)
                        Text("Home")
                    }
                   // .environmentObject(homeVM)
                
                CatalogView()
                    .environmentObject(catalogVM)
                    .tabItem {
                        Image(uiImage: Asset.Image.TabBars.catalog.image)
                        Text("Catalog")
                        
                    }
                
                CartView()
                    .environmentObject(cartVC)
                    .tabItem {
                        Image(uiImage: Asset.Image.TabBars.cart.image)
                        Text("Cart")
                    }
                
                WishlistView()
                    .environmentObject(wishlistVM)
                    .tabItem {
                        Image(uiImage: Asset.Image.TabBars.wishlist.image)
                        Text("Wishlist")
                    }
                ProfileView()
                    .environmentObject(profileVM)
                    .tabItem {
                        Image(uiImage: Asset.Image.TabBars.profile.image)
                        Text("Profile")
                    }
//                    .onAppear {
//                        self.profileVM.count = 100
//                    }
            }
        }
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
