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
    
    @StateObject var homeVM = HomeViiewModel()
    @StateObject var wishlistVM = WishlistViewModel()
    @StateObject var catalogVM = CatalogViewModel()
    @StateObject var cartVC = CartViewModel()
    @StateObject var profileVM = ProfileViewModel()
    
    var body: some View {
        ZStack {
            Blur(style: .extraLight)
                .edgesIgnoringSafeArea(.all)
            
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "1.circle")
                        Text("Home")
                    }
                    .environmentObject(homeVM)
                
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
                
                WishlistView()
                    .environmentObject(wishlistVM)
                    .tabItem {
                        Image(systemName: "4.circle")
                        Text("Wishlist")
                    }
                ProfileView()
                    .environmentObject(profileVM)
                    .tabItem {
                        Image(systemName: "5.circle")
                        Text("Profile")
                    }
                    .onAppear {
                        self.profileVM.count = 100
                    }
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

#Preview {
    TabBarView()
}
