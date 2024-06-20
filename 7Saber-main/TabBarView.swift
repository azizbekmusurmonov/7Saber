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
                        Image(systemName: "1.circle")
                        Text("Home")
                    }
                  //  .environmentObject(homeVM)
                
                CatalogView()
                    .environmentObject(catalogVM)
                    .tabItem {
                        Image(systemName: "2.circle")
                        Text("Catalog")
                    }
                
                CartView()
                    .environmentObject(cartVC)
                    .tabItem {
                        Image(systemName: "3.circle")
                        Text("Cart")
                    }
                
                ZStack {
                    if !isRegistrated {
                        RegisterMobillAppView(skipButtonTapped: {
                            isRegistrated = true
                        })
                    } else {
                        WishlistView()
                            .environmentObject(wishlistVM)
                    }
                }
                .tabItem {
                    Image(uiImage: Asset.Image.TabBars.wishlist.image)
                    Text("Wishlist")
                }
                
                ZStack {
                    if !isRegistrated {
                        RegisterMobillAppView(skipButtonTapped: {
                            isRegistrated = true
                        })
                    } else {
                        ProfileView()
                            .environmentObject(profileVM)
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

